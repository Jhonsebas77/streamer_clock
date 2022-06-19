part of com.jsob.flutter_clock.views;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
    initializeDateFormatting(
      'es_CO',
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Time',
        theme: mainTheme,
        home: const HomeView(),
      );
}
