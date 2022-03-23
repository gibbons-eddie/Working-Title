import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/main_layout.dart';
import 'package:senior_project/theme.dart';

void main() => runApp(
    const MyApp()); // always needs main function in this file; 'runApp' for Flutter applications

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Senior Project Sample';

  @override
  Widget build(BuildContext context) {
    // 'build' is the root of the whole application/widget tree here
    return MaterialApp(
      title: _title,
      theme:
          appTheme, // more can go here, basically sets how the app is organized
      home: const MainLayout(),
    );
  }
}
