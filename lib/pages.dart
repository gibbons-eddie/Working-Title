import 'package:flutter/material.dart';
import 'package:senior_project/theme.dart';

class _TestPage extends StatelessWidget {
  final String title;

  const _TestPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.darkPurple,
      child: Center(
        child: Text(title),
      ),
    );
  }
}

var pages = [
  const _TestPage(title: 'QuickChat'),
  const _TestPage(title: 'Modules'),
  const _TestPage(title: 'Profile'),
  const _TestPage(title: 'Settings'),
];
