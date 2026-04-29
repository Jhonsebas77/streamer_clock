package com.example.streamer_clock

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.Timer
import java.util.TimerTask

class StreamerClockWidgetReceiver : AppWidgetProvider() {
    
    private var timer: Timer? = null
    
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
        
        startTimer(context, appWidgetManager, appWidgetIds)
    }
    
    private fun startTimer(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        timer?.cancel()
        timer = Timer()
        
        timer?.scheduleAtFixedRate(object : TimerTask() {
            override fun run() {
                for (appWidgetId in appWidgetIds) {
                    updateAppWidget(context, appWidgetManager, appWidgetId)
                }
            }
        }, 0, 60000)
    }
    
    private fun updateAppWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int
    ) {
        val now = Date()
        
        val timeFormat = SimpleDateFormat("hh:mm a", Locale.getDefault())
        val dateFormat = SimpleDateFormat("EEE, d MMM", Locale("es", "CO"))
        
        val timeText = timeFormat.format(now).uppercase()
        val dateText = dateFormat.format(now).uppercase().replace(".", "")
        
        val views = RemoteViews(context.packageName, R.layout.streamer_clock_widget)
        views.setTextViewText(R.id.time_widget, timeText)
        views.setTextViewText(R.id.date_widget, dateText)
        
        appWidgetManager.updateAppWidget(appWidgetId, views)
    }
    
    override fun onEnabled(context: Context) {}
    
    override fun onDisabled(context: Context) {
        timer?.cancel()
        timer = null
    }
}