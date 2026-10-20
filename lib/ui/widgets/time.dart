part of com.ota_labs.streamer_clock.app.ui.widgets;

class TimeWidget extends StatelessWidget {
  const TimeWidget({required this.now, super.key});

  final DateTime now;

  static final DateFormat _format = DateFormat('hh:mm a');

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const Icon(Icons.access_time, color: Colors.green_brilliant),
      const SizedBox(width: 4),
      Flexible(
        child: Text(
          _format.format(now),
          style: textStyle(color: Colors.green_brilliant),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
