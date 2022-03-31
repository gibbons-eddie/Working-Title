import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Placeholder(
          fallbackHeight: 90,
          fallbackWidth: 90,
        ),
        const SizedBox(width: 23),
        Flexible(
          child: Text(
            'Test User',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}
