package org.ahsan.dpdns.sms_harvester

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.util.Log
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerParameters
import java.util.concurrent.TimeUnit

class SmsInboxScanWorker(
    appContext: Context,
    workerParams: WorkerParameters,
) : CoroutineWorker(appContext, workerParams) {
    override suspend fun doWork(): Result {
        Log.d(LOG_TAG, "15-minute inbox worker started")
        if (!applicationContext.hasReadSmsPermission()) {
            Log.d(LOG_TAG, "15-minute inbox worker skipped: READ_SMS permission not granted")
            return Result.success()
        }

        val messages = SmsInboxReader.readInboxSms(applicationContext.contentResolver)
        val stagedCount = SmsPendingStore.appendNewInboxMessages(applicationContext, messages)
        val insertedCount = SmsDatabaseWriter.upsertMany(applicationContext, messages)
        Log.d(
            LOG_TAG,
            "15-minute inbox worker finished: read=${messages.size}, "
                + "staged=$stagedCount, dbInserted=$insertedCount",
        )
        return Result.success()
    }

    companion object {
        private const val LOG_TAG = "SmsHarvester"
        private const val UNIQUE_WORK_NAME = "sms_inbox_scan_every_15_minutes"

        fun schedule(context: Context) {
            if (!context.hasReadSmsPermission()) {
                Log.d(LOG_TAG, "15-minute inbox worker schedule skipped: READ_SMS not granted")
                return
            }

            val request = PeriodicWorkRequestBuilder<SmsInboxScanWorker>(
                15,
                TimeUnit.MINUTES,
            ).build()

            WorkManager.getInstance(context).enqueueUniquePeriodicWork(
                UNIQUE_WORK_NAME,
                ExistingPeriodicWorkPolicy.KEEP,
                request,
            )
            Log.d(LOG_TAG, "15-minute inbox worker scheduled with KEEP policy")
        }
    }
}

private fun Context.hasReadSmsPermission(): Boolean {
    return checkSelfPermission(Manifest.permission.READ_SMS) == PackageManager.PERMISSION_GRANTED
}
