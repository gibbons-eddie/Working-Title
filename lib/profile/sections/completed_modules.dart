import 'package:flutter/material.dart';
import 'package:senior_project/profile/completion_badge.dart';

class CompletedModules extends StatelessWidget {
  final List<double> moduleProgress;

  const CompletedModules({required this.moduleProgress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> badges = [];
    moduleProgress.asMap().entries.forEach(
      (element) {
        int index = element.key;
        double progress = element.value;

        if (progress == 1) {
          badges.add(
            CompletionBadge(
              name: 'Module ${index + 1}',
              image: AssetImage('assets/images/Module${index + 1}.PNG'),
            ),
          );
        }
      },
    );

    return Wrap(
      // spacing: 47,
      // runSpacing: 12,
      alignment: WrapAlignment.spaceEvenly,
      children: badges,
    );
  }
}
