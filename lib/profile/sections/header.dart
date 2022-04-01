import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String name;
  const Header({Key? key, required this.name}) : super(key: key);

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
            name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
