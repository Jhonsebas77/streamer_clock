part of com.jsob.flutter_clock.views;

@pragma('vm:entry-point')
Future<void> callbackDispatcher() async {
  Workmanager().executeTask((String taskName, Map<String, dynamic>? inputData) {
    DateTime now = DateTime.now();
    String timeStr = '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}';
    String dateStr = _formatDate(now);
    
    return Future.wait<bool?>(<Future<bool?>>[
      HomeWidget.saveWidgetData('time', timeStr),
      HomeWidget.saveWidgetData('date', dateStr),
    ]).then((List<bool?> value) async {
      await Future.wait<bool?>(<Future<bool?>>[
        HomeWidget.updateWidget(
          name: 'StreamerClockWidgetProvider',
          iOSName: 'StreamerClockWidget',
        ),
        if (Platform.isAndroid)
          HomeWidget.updateWidget(
            qualifiedAndroidName: 
                'com.example.streamer_clock.StreamerClockWidgetReceiver',
          ),
      ]);
      return !value.contains(false);
    });
  });
}

String _formatDate(DateTime date) {
  List<String> weekdays = <String>['LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB', 'DOM'];
  List<String> months = <String>['ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN', 
      'JUL', 'AGO', 'SEP', 'OCT', 'NOV', 'DIC'];
  return '${weekdays[date.weekday - 1]}, ${date.day.toString().padLeft(2, '0')} '
      '${months[date.month - 1]}';
}
