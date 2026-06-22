package org.ahsan.dpdns.sms_harvester

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.provider.Telephony
import android.util.Log
import org.json.JSONObject

class SmsBroadcastReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != Telephony.Sms.Intents.SMS_RECEIVED_ACTION) return

        val messages = Telephony.Sms.Intents.getMessagesFromIntent(intent)
        if (messages.isEmpty()) {
            Log.d(LOG_TAG, "SMS broadcast received with no message parts")
            return
        }

        val address = messages.firstOrNull()?.originatingAddress
        val serviceCenter = messages.firstOrNull()?.serviceCenterAddress
        val timestampMillis = messages.minOfOrNull { it.timestampMillis } ?: System.currentTimeMillis()
        val body = messages.joinToString(separator = "") { it.messageBody.orEmpty() }

        val stagedMessage = JSONObject()
            .put("providerId", JSONObject.NULL)
            .put("threadId", JSONObject.NULL)
            .put("address", address)
            .put("body", body)
            .put("dateMillis", timestampMillis)
            .put("dateSentMillis", timestampMillis)
            .put("type", "inbox")
            .put("read", false)
            .put("seen", false)
            .put("serviceCenter", serviceCenter)

        Log.d(
            LOG_TAG,
            "SMS broadcast received: sender=$address, parts=${messages.size}",
        )
        SmsPendingStore.append(context, stagedMessage)
        val inserted = SmsDatabaseWriter.upsertOne(context, stagedMessage.toMap())
        Log.d(LOG_TAG, "SMS broadcast native DB write finished: inserted=$inserted")
    }

    companion object {
        private const val LOG_TAG = "SmsHarvester"
    }
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
