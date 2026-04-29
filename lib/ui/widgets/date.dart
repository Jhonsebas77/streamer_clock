part of com.jsob.flutter_clock.ui.widgets;

class DateWidget extends StatefulWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  late final Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.today, color: Colors.green_brillant),
          const SizedBox(width: 4),
          Text(
            DateFormat('E, d MMM', 'es_CO')
                .format(_now)
                .toUpperCase()
                .replaceAll('.', ''),
            style: textStyle(color: Colors.green_brillant),
          ),
        ],
      );
}
