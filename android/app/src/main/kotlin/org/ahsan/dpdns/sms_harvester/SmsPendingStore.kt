package org.ahsan.dpdns.sms_harvester

import android.content.Context
import android.util.Log
import org.json.JSONArray
import org.json.JSONObject

object SmsPendingStore {
    private const val LOG_TAG = "SmsHarvester"

    const val PREFS_NAME = "sms_harvester_incoming_sms"
    const val PENDING_MESSAGES_KEY = "pending_messages"

    private const val STAGED_PROVIDER_IDS_KEY = "staged_provider_ids"

    fun append(context: Context, message: JSONObject) {
        val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val pendingMessages = JSONArray(preferences.getString(PENDING_MESSAGES_KEY, "[]"))
        pendingMessages.put(message)
        Log.d(
            LOG_TAG,
            "Pending SMS appended from broadcast: sender=${message.optString("address")}, "
                + "queueSize=${pendingMessages.length()}",
        )

        preferences
            .edit()
            .putString(PENDING_MESSAGES_KEY, pendingMessages.toString())
            .apply()
    }

    fun appendNewInboxMessages(context: Context, messages: List<Map<String, Any?>>): Int {
        val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val stagedProviderIds = preferences.getStringSet(STAGED_PROVIDER_IDS_KEY, emptySet()).orEmpty()
        val nextStagedProviderIds = stagedProviderIds.toMutableSet()
        val pendingMessages = JSONArray(preferences.getString(PENDING_MESSAGES_KEY, "[]"))
        var stagedCount = 0

        for (message in messages) {
            val providerId = message["providerId"]?.toString() ?: continue
            if (!nextStagedProviderIds.add(providerId)) continue

            pendingMessages.put(JSONObject(message))
            stagedCount++
        }
        Log.d(
            LOG_TAG,
            "Pending SMS appended from inbox scan: read=${messages.size}, "
                + "newlyStaged=$stagedCount, queueSize=${pendingMessages.length()}",
        )

        preferences
            .edit()
            .putString(PENDING_MESSAGES_KEY, pendingMessages.toString())
            .putStringSet(STAGED_PROVIDER_IDS_KEY, nextStagedProviderIds)
            .apply()

        return stagedCount
    }

    fun drain(context: Context): List<Map<String, Any?>> {
        val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val rawMessages = preferences.getString(PENDING_MESSAGES_KEY, "[]")
        val jsonMessages = JSONArray(rawMessages)
        val messages = mutableListOf<Map<String, Any?>>()

        for (index in 0 until jsonMessages.length()) {
            val item = jsonMessages.optJSONObject(index) ?: continue
            messages.add(item.toMap())
        }
        Log.d(LOG_TAG, "Pending SMS drained: count=${messages.size}")

        preferences.edit().putString(PENDING_MESSAGES_KEY, "[]").apply()
        return messages
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
}
