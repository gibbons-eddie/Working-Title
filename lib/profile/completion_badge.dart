import 'package:flutter/material.dart';
import 'package:senior_project/theme.dart';

class CompletionBadge extends StatelessWidget {
  final AssetImage image;
  const CompletionBadge({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1 / 3,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: CustomColors.darkGray,
        child: CircleAvatar(
          radius: 29,
          backgroundImage: image,
        ),
      ),
    );
  }
}
