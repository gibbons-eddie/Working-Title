import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:senior_project/profile/stats_block.dart';
import 'package:senior_project/theme.dart';

class Statistics extends StatelessWidget {
  final int completedModules;
  final int quickchatsPracticed;
  final int exercisesCompleted;

  const Statistics(
      {Key? key,
      required this.completedModules,
      required this.quickchatsPracticed,
      required this.exercisesCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: StatsBlock(
                  value: completedModules, measurement: 'Completed Modules'),
            ),
            Expanded(
              flex: 3,
              child: StatsBlock(
                  value: quickchatsPracticed,
                  measurement: 'QuickChats Practiced'),
            ),
            Expanded(
              flex: 3,
              child: StatsBlock(
                  value: exercisesCompleted,
                  measurement: 'Exercises Completed'),
            )
          ],
        ),
        const SizedBox(height: 14),
        LinearPercentIndicator(
          percent: 2 / 3,
          lineHeight: 28,
          progressColor: CustomColors.lightGreen,
          backgroundColor: CustomColors.lightGray,
          animation: true,
          animationDuration: 500,
          barRadius: const Radius.circular(3),
          padding: const EdgeInsets.all(0),
          center: const Text('66% Quickchat Accuracy'),
        ),
      ],
    );
  }
}
