import 'package:flutter/material.dart';
import 'package:senior_project/profile/completion_badge.dart';

class CompletedModules extends StatelessWidget {
  const CompletedModules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 47,
      runSpacing: 12,
      children: const [
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
        CompletionBadge(
          image: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/university_logo.png'),
          ),
        ),
      ],
    );
  }
}
