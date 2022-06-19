// ignore_for_file: use_late_for_private_fields_and_variables

part of com.jsob.flutter_clock.views;

class LocalizationApp extends StatelessWidget {
  const LocalizationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => EasyLocalization(
        supportedLocales: const <Locale>[
          Locale('es', 'CO'),
        ],
        startLocale: const Locale('es', 'CO'),
        fallbackLocale: const Locale('es', 'CO'),
        assetLoader: const RootBundleAssetLoader(),
        path: 'assets/languages',
        saveLocale: true,
        useOnlyLangCode: false,
        child: const MyApp(),
      );
}
