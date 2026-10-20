part of com.ota_labs.streamer_clock.app.ui.views;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Timer? _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _scheduleTick();
  }

  /// The clock only shows minutes, so it rebuilds once per minute, right
  /// when the minute changes.
  void _scheduleTick() {
    DateTime now = DateTime.now();
    Duration untilNextMinute = Duration(
      seconds: 60 - now.second,
      milliseconds: -now.millisecond,
    );
    _timer = Timer(untilNextMinute, () {
      setState(() => _now = DateTime.now());
      _scheduleTick();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              // Lays out date and time in a row; stacks the date over
              // the time when there is not enough horizontal space.
              child: OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
                overflowSpacing: 4,
                children: <Widget>[
                  DateWidget(now: _now),
                  TimeWidget(now: _now),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
