import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final Widget child;

  const ProfileSection({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}
