package org.ahsan.dpdns.sms_harvester

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.provider.Telephony
import org.json.JSONArray
import org.json.JSONObject

class SmsBroadcastReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != Telephony.Sms.Intents.SMS_RECEIVED_ACTION) return

        val messages = Telephony.Sms.Intents.getMessagesFromIntent(intent)
        if (messages.isEmpty()) return

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

        val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val pendingMessages = JSONArray(preferences.getString(PENDING_MESSAGES_KEY, "[]"))
        pendingMessages.put(stagedMessage)

        preferences
            .edit()
            .putString(PENDING_MESSAGES_KEY, pendingMessages.toString())
            .apply()
    }

    companion object {
        const val PREFS_NAME = "sms_harvester_incoming_sms"
        const val PENDING_MESSAGES_KEY = "pending_messages"
    }
}
