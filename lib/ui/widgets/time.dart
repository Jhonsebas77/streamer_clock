// ignore_for_file: always_specify_types
part of com.jsob.flutter_clock.ui.widgets;

class TimeWidget extends StatelessWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) =>
            Center(
          child: Row(
            children: <Widget>[
              const Icon(Icons.access_time, color: Colors.green_brillant),
              const SizedBox(width: 4),
              Text(
                DateFormat('hh:mm a').format(DateTime.now()),
                style: textStyle(color: Colors.green_brillant),
              ),
            ],
          ),
        ),
      );
}
