import 'package:flutter/material.dart';
import 'package:stick_it/utils/colors.dart'; //colors of my application
import 'package:flutter/services.dart'; //services for making up stay vertical
import 'package:stick_it/LoginPage.dart'; //class of list of capsules
import 'package:stick_it/drawScene.dart'; //class of list of capsules

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]); //force vertical mode on phone only
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StickIt',
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home:
          const drawScene(), //const ResponsiveLayout(mobileScreenLayout: mobileScreenLayout()),
    );
  }
}
