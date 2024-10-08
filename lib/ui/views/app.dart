part of com.jsob.flutter_clock.views;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() {
    WidgetsFlutterBinding.ensureInitialized();
    Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
    initializeDateFormatting('es_CO');
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Time',
        theme: mainTheme,
        home: const HomeView(),
      );
}
