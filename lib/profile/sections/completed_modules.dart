import 'package:flutter/material.dart';
import 'package:senior_project/profile/completion_badge.dart';

class CompletedModules extends StatelessWidget {
  const CompletedModules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // spacing: 47,
      // runSpacing: 12,
      alignment: WrapAlignment.spaceEvenly,
      children: const [
        CompletionBadge(image: AssetImage('assets/images/Module1.PNG')),
        CompletionBadge(image: AssetImage('assets/images/Module2.PNG')),
        CompletionBadge(image: AssetImage('assets/images/Module3.PNG')),
      ],
    );
  }
}
