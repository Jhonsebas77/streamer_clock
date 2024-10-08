part of com.jsob.flutter_clock.views;

/// Used for Background Updates using Workmanager Plugin
@pragma('vm:entry-point')
Future<void> callbackDispatcher() async {
  Workmanager().executeTask((String taskName, Map<String, dynamic>? inputData) {
    DateTime now = DateTime.now();
    return Future.wait<bool?>(<Future<bool?>>[
      HomeWidget.saveWidgetData(
        'title',
        'Updated from Background',
      ),
      HomeWidget.saveWidgetData(
        'message',
        '''${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}''',
      ),
    ]).then((List<bool?> value) async {
      await Future.wait<bool?>(<Future<bool?>>[
        HomeWidget.updateWidget(
          name: 'HomeWidgetExampleProvider',
          iOSName: 'HomeWidgetExample',
        ),
        if (Platform.isAndroid)
          HomeWidget.updateWidget(
            qualifiedAndroidName:
                'es.antonborri.home_widget_example.glance.HomeWidgetReceiver',
          ),
      ]);
      return !value.contains(false);
    });
  });
}

/// Called when Doing Background Work initiated from Widget
@pragma('vm:entry-point')
Future<void> interactiveCallback(Uri? data) async {
  if (data?.host == 'titleclicked') {
    List<String> greetings = <String>[
      'Hello',
      'Hallo',
      'Bonjour',
      'Hola',
      'Ciao',
      '哈洛',
      '안녕하세요',
      'xin chào',
    ];
    String selectedGreeting = greetings[Random().nextInt(greetings.length)];
    await HomeWidget.setAppGroupId('YOUR_GROUP_ID');
    await HomeWidget.saveWidgetData<String>('title', selectedGreeting);
    await HomeWidget.updateWidget(
      name: 'HomeWidgetExampleProvider',
      iOSName: 'HomeWidgetExample',
    );
    if (Platform.isAndroid) {
      await HomeWidget.updateWidget(
        qualifiedAndroidName:
            'es.antonborri.home_widget_example.glance.HomeWidgetReceiver',
      );
    }
  }
}
