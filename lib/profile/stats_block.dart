import 'package:flutter/material.dart';

class StatsBlock extends StatelessWidget {
  final int value;
  final String measurement;

  const StatsBlock({Key? key, required this.value, required this.measurement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          measurement,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
