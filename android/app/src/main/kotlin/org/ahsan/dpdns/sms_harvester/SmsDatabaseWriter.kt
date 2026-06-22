package org.ahsan.dpdns.sms_harvester

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.util.Log
import java.io.File
import java.security.MessageDigest

object SmsDatabaseWriter {
    private const val LOG_TAG = "SmsHarvester"
    private const val DATABASE_NAME = "sms_harvester.sqlite"

    fun upsertMany(context: Context, messages: List<Map<String, Any?>>): Int {
        if (messages.isEmpty()) {
            Log.d(LOG_TAG, "Native DB upsert skipped: no messages")
            return 0
        }

        val databaseFile = databaseFile(context)
        databaseFile.parentFile?.mkdirs()

        SQLiteDatabase.openOrCreateDatabase(databaseFile, null).use { database ->
            ensureSchema(database)
            database.beginTransaction()
            try {
                var inserted = 0
                for (message in messages) {
                    if (upsert(database, message)) inserted++
                }
                database.setTransactionSuccessful()
                Log.d(
                    LOG_TAG,
                    "Native DB upsert finished: input=${messages.size}, inserted=$inserted",
                )
                return inserted
            } finally {
                database.endTransaction()
            }
        }
    }

    fun upsertOne(context: Context, message: Map<String, Any?>): Boolean {
        return upsertMany(context, listOf(message)) == 1
    }

    private fun upsert(database: SQLiteDatabase, message: Map<String, Any?>): Boolean {
        val fingerprint = message.fingerprint()
        val existingId = findExistingId(
            database = database,
            providerId = message.longValue("providerId"),
            fingerprint = fingerprint,
        )
        val values = message.toContentValues(fingerprint)

        return if (existingId == null) {
            database.insertWithOnConflict(
                "sms_messages",
                null,
                values,
                SQLiteDatabase.CONFLICT_IGNORE,
            ) != -1L
        } else {
            values.remove("sync_status")
            values.put("updated_at", System.currentTimeMillis())
            database.update(
                "sms_messages",
                values,
                "id = ?",
                arrayOf(existingId.toString()),
            )
            false
        }
    }

    private fun findExistingId(
        database: SQLiteDatabase,
        providerId: Long?,
        fingerprint: String,
    ): Long? {
        if (providerId != null) {
            database.query(
                "sms_messages",
                arrayOf("id"),
                "provider_id = ?",
                arrayOf(providerId.toString()),
                null,
                null,
                null,
                "1",
            ).use { cursor ->
                if (cursor.moveToFirst()) return cursor.getLong(0)
            }
        }

        database.query(
            "sms_messages",
            arrayOf("id"),
            "fingerprint = ?",
            arrayOf(fingerprint),
            null,
            null,
            null,
            "1",
        ).use { cursor ->
            if (cursor.moveToFirst()) return cursor.getLong(0)
        }

        return null
    }

    private fun ensureSchema(database: SQLiteDatabase) {
        database.execSQL(
            """
            CREATE TABLE IF NOT EXISTS sms_messages (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                provider_id INTEGER NULL,
                thread_id INTEGER NULL,
                address TEXT NULL,
                body TEXT NOT NULL,
                date_millis INTEGER NOT NULL,
                date_sent_millis INTEGER NULL,
                type TEXT NOT NULL DEFAULT 'inbox',
                read INTEGER NULL,
                seen INTEGER NULL,
                status INTEGER NULL,
                service_center TEXT NULL,
                protocol INTEGER NULL,
                subject TEXT NULL,
                reply_path_present INTEGER NULL,
                locked INTEGER NULL,
                error_code INTEGER NULL,
                creator TEXT NULL,
                subscription_id INTEGER NULL,
                fingerprint TEXT NOT NULL,
                sync_status TEXT NOT NULL DEFAULT 'pending',
                server_id TEXT NULL,
                last_sync_attempt_at_millis INTEGER NULL,
                sync_error TEXT NULL,
                created_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now') * 1000),
                updated_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now') * 1000)
            )
            """.trimIndent(),
        )
        database.execSQL(
            """
            CREATE UNIQUE INDEX IF NOT EXISTS sms_messages_provider_id_unique
            ON sms_messages(provider_id) WHERE provider_id IS NOT NULL
            """.trimIndent(),
        )
        database.execSQL(
            """
            CREATE UNIQUE INDEX IF NOT EXISTS sms_messages_fingerprint_unique
            ON sms_messages(fingerprint)
            """.trimIndent(),
        )
        if (database.version < 1) {
            database.version = 1
        }
    }

    private fun databaseFile(context: Context): File {
        return File(context.applicationInfo.dataDir, "app_flutter/$DATABASE_NAME")
    }

    private fun Map<String, Any?>.toContentValues(fingerprint: String): ContentValues {
        val values = ContentValues()
        putLongOrNull(values, "provider_id", longValue("providerId"))
        putLongOrNull(values, "thread_id", longValue("threadId"))
        values.put("address", stringValue("address"))
        values.put("body", stringValue("body").orEmpty())
        values.put("date_millis", longValue("dateMillis") ?: 0L)
        putLongOrNull(values, "date_sent_millis", longValue("dateSentMillis"))
        values.put("type", stringValue("type") ?: "inbox")
        putBooleanOrNull(values, "read", booleanValue("read"))
        putBooleanOrNull(values, "seen", booleanValue("seen"))
        putLongOrNull(values, "status", longValue("status"))
        values.put("service_center", stringValue("serviceCenter"))
        putLongOrNull(values, "protocol", longValue("protocol"))
        values.put("subject", stringValue("subject"))
        putBooleanOrNull(values, "reply_path_present", booleanValue("replyPathPresent"))
        putBooleanOrNull(values, "locked", booleanValue("locked"))
        putLongOrNull(values, "error_code", longValue("errorCode"))
        values.put("creator", stringValue("creator"))
        putLongOrNull(values, "subscription_id", longValue("subscriptionId"))
        values.put("fingerprint", fingerprint)
        values.put("sync_status", "pending")
        return values
    }

    private fun Map<String, Any?>.fingerprint(): String {
        val source = listOf(
            stringValue("address").orEmpty(),
            stringValue("body").orEmpty(),
            (longValue("dateMillis") ?: 0L).toString(),
            stringValue("type") ?: "inbox",
        ).joinToString("|")
        val bytes = MessageDigest.getInstance("SHA-256").digest(source.toByteArray())
        return bytes.joinToString("") { "%02x".format(it) }
    }

    private fun Map<String, Any?>.longValue(key: String): Long? {
        val value = this[key] ?: return null
        return when (value) {
            is Long -> value
            is Int -> value.toLong()
            is Number -> value.toLong()
            is String -> value.toLongOrNull()
            else -> null
        }
    }

    private fun Map<String, Any?>.stringValue(key: String): String? {
        val value = this[key] ?: return null
        return value.toString()
    }

    private fun Map<String, Any?>.booleanValue(key: String): Boolean? {
        val value = this[key] ?: return null
        return when (value) {
            is Boolean -> value
            is Number -> value.toInt() == 1
            is String -> value == "1" || value.equals("true", ignoreCase = true)
            else -> null
        }
    }

    private fun putLongOrNull(values: ContentValues, key: String, value: Long?) {
        if (value == null) {
            values.putNull(key)
        } else {
            values.put(key, value)
        }
    }

    private fun putBooleanOrNull(values: ContentValues, key: String, value: Boolean?) {
        if (value == null) {
            values.putNull(key)
        } else {
            values.put(key, if (value) 1 else 0)
        }
    }
}
