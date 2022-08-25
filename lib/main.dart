import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_runner_driver/index.dart';
import 'package:road_runner_driver/shared/shared.dart';

import 'index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: 'Road Runner Rider',
          theme: theme,
          darkTheme: darkTheme,
          home: const App(),
        );
      },
      initial: AdaptiveThemeMode.light,
      light: lightTheme,
      dark: darkTheme,
    );
  }
}
