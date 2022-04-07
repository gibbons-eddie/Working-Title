import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:senior_project/profile/stats_block.dart';
import 'package:senior_project/theme.dart';

class Statistics extends StatelessWidget {
  final int completedModules;
  final int exercisesCompleted;
  final List<double> moduleProgress;

  const Statistics({
    Key? key,
    required this.completedModules,
    required this.exercisesCompleted,
    required this.moduleProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StatsBlock(
                  value: completedModules, measurement: 'Completed Modules'),
            ),
            Expanded(
              child: StatsBlock(
                  value: exercisesCompleted,
                  measurement: 'Exercises Completed'),
            )
          ],
        ),

        // Spacing
        const SizedBox(height: 12),

        // Progress bars
        Wrap(
          runSpacing: 12,
          children: [
            ...moduleProgress.asMap().entries.map((entry) {
              int index = entry.key;
              double progress = entry.value;

              return LinearPercentIndicator(
                percent: progress,
                lineHeight: 32,
                progressColor: CustomColors.lightGreen,
                backgroundColor: CustomColors.lightGray,
                animation: true,
                animationDuration: 500,
                barRadius: const Radius.circular(3),
                padding: const EdgeInsets.all(0),
                center: Text(
                    'Module ${index + 1} - ${(progress * 100).toStringAsFixed(0)}%'),
              );
            }).toList()
          ],
        )
      ],
    );
  }
}
