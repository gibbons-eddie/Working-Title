import 'package:flutter/material.dart';
import 'package:senior_project/theme.dart';

class SubContainer extends StatelessWidget {
  final Widget child;

  const SubContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Take up all possible space
      // constraints: const BoxConstraints.expand(),
      margin: const EdgeInsets.only(
        left: 29,
        right: 29,
      ),
      padding: const EdgeInsets.only(
        left: 29,
        right: 29,
        top: 50,
        bottom: 50,
      ),

      // Add border and background
      decoration: BoxDecoration(
        color: CustomColors.white,
        border: Border.all(
          color: CustomColors.lightGreen,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(65),
      ),

      // Content
      child: child,
    );
  }
}
