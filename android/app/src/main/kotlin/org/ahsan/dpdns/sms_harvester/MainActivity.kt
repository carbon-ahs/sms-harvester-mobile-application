package org.ahsan.dpdns.sms_harvester

import android.Manifest
import android.content.pm.PackageManager
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

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
        Log.d(LOG_TAG, "Flutter requested inbox SMS read")
        if (!hasReadSmsPermission()) {
            Log.d(LOG_TAG, "Inbox read skipped: READ_SMS permission not granted")
            return emptyList()
        }

        SmsInboxScanWorker.schedule(this)
        val messages = SmsInboxReader.readInboxSms(contentResolver)
        Log.d(LOG_TAG, "Flutter inbox read returned ${messages.size} messages")
        return messages
    }

    private fun drainPendingIncomingSms(): List<Map<String, Any?>> {
        Log.d(LOG_TAG, "Flutter requested pending SMS drain")
        val messages = SmsPendingStore.drain(this)
        Log.d(LOG_TAG, "Flutter pending SMS drain returned ${messages.size} messages")
        return messages
    }

    private fun hasReadSmsPermission(): Boolean {
        return checkSelfPermission(Manifest.permission.READ_SMS) == PackageManager.PERMISSION_GRANTED
    }

    companion object {
        private const val SMS_CHANNEL = "org.ahsan.dpdns.sms_harvester/sms"
        private const val LOG_TAG = "SmsHarvester"
    }
}
