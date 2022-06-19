part of com.jsob.flutter_clock.views;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 50,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: const <Widget>[
                      DateWidget(),
                      Spacer(),
                      TimeWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
