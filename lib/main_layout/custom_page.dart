import 'package:flutter/material.dart';
import 'package:senior_project/theme.dart';

class CustomPage extends StatelessWidget {
  final String title; // text to display on the app bar
  final IconData icon; // icon to display on the nav bar
  final Widget _child; // child widget to display in the body

  const CustomPage(
      {Key? key,
      required this.title,
      required Widget child,
      required this.icon})
      : _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.darkPurple,
      child: _child,
    );
  }
}
