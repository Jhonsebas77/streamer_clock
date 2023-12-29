part of com.jsob.flutter_clock.ui.widgets;

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<dynamic>(
        stream: Stream<dynamic>.periodic(const Duration(seconds: 1)),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) =>
            Center(
          child: Row(
            children: <Widget>[
              const Icon(Icons.today, color: Colors.green_brillant),
              const SizedBox(width: 4),
              Text(
                DateFormat('E, d MMM', 'es_CO')
                    .format(DateTime.now())
                    .toUpperCase()
                    .replaceAll('.', ''),
                style: textStyle(color: Colors.green_brillant),
              ),
            ],
          ),
        ),
      );
}
