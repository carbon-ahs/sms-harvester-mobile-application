package org.ahsan.dpdns.sms_harvester

import android.Manifest
import android.content.pm.PackageManager
import android.database.Cursor
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONArray
import org.json.JSONObject

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            SMS_CHANNEL,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "readInboxSms" -> result.success(readInboxSms())
                "drainPendingIncomingSms" -> result.success(drainPendingIncomingSms())
                else -> result.notImplemented()
            }
        }
    }

    private fun readInboxSms(): List<Map<String, Any?>> {
        if (!hasReadSmsPermission()) return emptyList()

        val uri = Uri.parse("content://sms/inbox")
        val projection = arrayOf(
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

        val messages = mutableListOf<Map<String, Any?>>()
        contentResolver.query(uri, projection, null, null, "date DESC")?.use { cursor ->
            while (cursor.moveToNext()) {
                messages.add(cursor.toSmsMap())
            }
        }
        return messages
    }

    private fun drainPendingIncomingSms(): List<Map<String, Any?>> {
        val preferences = getSharedPreferences(SmsBroadcastReceiver.PREFS_NAME, MODE_PRIVATE)
        val rawMessages = preferences.getString(SmsBroadcastReceiver.PENDING_MESSAGES_KEY, "[]")
        val jsonMessages = JSONArray(rawMessages)
        val messages = mutableListOf<Map<String, Any?>>()

        for (index in 0 until jsonMessages.length()) {
            val item = jsonMessages.optJSONObject(index) ?: continue
            messages.add(item.toMap())
        }

        preferences.edit().putString(SmsBroadcastReceiver.PENDING_MESSAGES_KEY, "[]").apply()
        return messages
    }

    private fun hasReadSmsPermission(): Boolean {
        return checkSelfPermission(Manifest.permission.READ_SMS) == PackageManager.PERMISSION_GRANTED
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

    private fun JSONObject.toMap(): Map<String, Any?> {
        val output = mutableMapOf<String, Any?>()
        val keys = keys()
        while (keys.hasNext()) {
            val key = keys.next()
            output[key] = if (isNull(key)) null else get(key)
        }
        return output
    }

    companion object {
        private const val SMS_CHANNEL = "org.ahsan.dpdns.sms_harvester/sms"
    }
}
