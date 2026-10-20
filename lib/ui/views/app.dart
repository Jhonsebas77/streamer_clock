part of com.ota_labs.streamer_clock.app.ui.views;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Streamer Clock',
    theme: mainTheme,
    home: const HomeView(),
  );
}
