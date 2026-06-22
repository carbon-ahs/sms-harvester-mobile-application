package org.ahsan.dpdns.sms_harvester

import android.content.ContentResolver
import android.database.Cursor
import android.net.Uri
import android.util.Log

object SmsInboxReader {
    private const val LOG_TAG = "SmsHarvester"

    private val inboxUri = Uri.parse("content://sms/inbox")

    private val projection = arrayOf(
        "_id",
        "thread_id",
        "address",
        "body",
        "date",
        "date_sent",
        "type",
        "read",
        "seen",
        "status",
        "service_center",
        "protocol",
        "subject",
        "reply_path_present",
        "locked",
        "error_code",
        "creator",
        "sub_id",
    )

    fun readInboxSms(contentResolver: ContentResolver): List<Map<String, Any?>> {
        Log.d(LOG_TAG, "Reading device inbox through content resolver")
        val messages = mutableListOf<Map<String, Any?>>()
        contentResolver.query(inboxUri, projection, null, null, "date DESC")?.use { cursor ->
            while (cursor.moveToNext()) {
                messages.add(cursor.toSmsMap())
            }
        }
        Log.d(LOG_TAG, "Device inbox read finished: ${messages.size} messages")
        return messages
    }

    private fun Cursor.toSmsMap(): Map<String, Any?> {
        return mapOf(
            "providerId" to getNullableLong("_id"),
            "threadId" to getNullableLong("thread_id"),
            "address" to getNullableString("address"),
            "body" to (getNullableString("body") ?: ""),
            "dateMillis" to (getNullableLong("date") ?: 0L),
            "dateSentMillis" to getNullableLong("date_sent"),
            "type" to "inbox",
            "read" to getNullableBoolean("read"),
            "seen" to getNullableBoolean("seen"),
            "status" to getNullableLong("status"),
            "serviceCenter" to getNullableString("service_center"),
            "protocol" to getNullableLong("protocol"),
            "subject" to getNullableString("subject"),
            "replyPathPresent" to getNullableBoolean("reply_path_present"),
            "locked" to getNullableBoolean("locked"),
            "errorCode" to getNullableLong("error_code"),
            "creator" to getNullableString("creator"),
            "subscriptionId" to getNullableLong("sub_id"),
        )
    }

    private fun Cursor.getNullableString(columnName: String): String? {
        val index = getColumnIndex(columnName)
        if (index < 0 || isNull(index)) return null
        return getString(index)
    }

    private fun Cursor.getNullableLong(columnName: String): Long? {
        val index = getColumnIndex(columnName)
        if (index < 0 || isNull(index)) return null
        return getLong(index)
    }

    private fun Cursor.getNullableBoolean(columnName: String): Boolean? {
        return getNullableLong(columnName)?.let { it == 1L }
    }
}
