part of com.ota_labs.streamer_clock.app.ui.widgets;

class DateWidget extends StatelessWidget {
  const DateWidget({required this.now, super.key});

  final DateTime now;

  static final DateFormat _format = DateFormat('E, d MMM', 'es_CO');

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const Icon(Icons.today, color: Colors.green_brilliant),
      const SizedBox(width: 4),
      Flexible(
        child: Text(
          _format.format(now).toUpperCase().replaceAll('.', ''),
          style: textStyle(color: Colors.green_brilliant),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
