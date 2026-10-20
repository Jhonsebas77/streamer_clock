package com.ota_labs.streamer_clock

import android.app.AlarmManager
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Date
import java.util.Locale

/**
 * Home screen clock widget.
 *
 * The time is rendered by a TextClock, which the system keeps up to date on
 * its own. Only the date is set from here: on widget updates, when the
 * time, time zone or locale change, and by an alarm at every midnight.
 */
class StreamerClockWidgetReceiver : AppWidgetProvider() {

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        when (intent.action) {
            ACTION_MIDNIGHT,
            Intent.ACTION_TIME_CHANGED,
            Intent.ACTION_TIMEZONE_CHANGED,
            Intent.ACTION_LOCALE_CHANGED -> updateAll(context)
        }
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        updateWidgets(context, appWidgetManager, appWidgetIds)
    }

    override fun onDisabled(context: Context) {
        alarmManager(context).cancel(midnightIntent(context))
    }

    private fun updateAll(context: Context) {
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val appWidgetIds = appWidgetManager.getAppWidgetIds(
            ComponentName(context, StreamerClockWidgetReceiver::class.java)
        )
        if (appWidgetIds.isNotEmpty()) {
            updateWidgets(context, appWidgetManager, appWidgetIds)
        }
    }

    private fun updateWidgets(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        val dateText = SimpleDateFormat("EEE, d MMM", Locale("es", "CO"))
            .format(Date())
            .uppercase()
            .replace(".", "")

        for (appWidgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.streamer_clock_widget)
            views.setTextViewText(R.id.date_widget, dateText)
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        scheduleMidnightUpdate(context)
    }

    private fun scheduleMidnightUpdate(context: Context) {
        val midnight = Calendar.getInstance().apply {
            add(Calendar.DAY_OF_YEAR, 1)
            set(Calendar.HOUR_OF_DAY, 0)
            set(Calendar.MINUTE, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
        }
        // Inexact alarm within one minute after midnight: needs no special
        // permission and lets the system batch wakeups.
        alarmManager(context).setWindow(
            AlarmManager.RTC,
            midnight.timeInMillis,
            60_000L,
            midnightIntent(context)
        )
    }

    private fun alarmManager(context: Context) =
        context.getSystemService(Context.ALARM_SERVICE) as AlarmManager

    private fun midnightIntent(context: Context): PendingIntent =
        PendingIntent.getBroadcast(
            context,
            0,
            Intent(context, StreamerClockWidgetReceiver::class.java)
                .setAction(ACTION_MIDNIGHT),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

    companion object {
        private const val ACTION_MIDNIGHT =
            "com.ota_labs.streamer_clock.action.MIDNIGHT"
    }
}
