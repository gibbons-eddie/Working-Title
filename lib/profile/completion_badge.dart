import 'package:flutter/material.dart';
import 'package:senior_project/theme.dart';

class CompletionBadge extends StatelessWidget {
  final Image image;
  const CompletionBadge({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.darkGray,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(128),
      ),
      child: image,
    );
  }
}
