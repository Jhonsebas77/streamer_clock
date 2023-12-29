part of com.jsob.flutter_clock.views;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 50,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
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
