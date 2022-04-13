import 'package:flutter/material.dart';
import 'package:senior_project/intermediate_exercises/intermediate_exercise.dart';
import 'package:senior_project/main_layout/title_bar.dart';
import 'package:senior_project/models/module.dart';
import 'package:senior_project/modules/exercise_container.dart';
import 'package:senior_project/theme.dart';

class ModuleDifficultySelection extends StatelessWidget {
  final Module module;

  const ModuleDifficultySelection({Key? key, required this.module})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Construct list of difficulty buttons
    final List<Widget> buttons =
        ['Beginner', 'Intermediate', 'Advanced'].asMap().entries.map((entry) {
      final difficultyIndex = entry.key;
      final difficultyStr = entry.value;

      // Each button will lead to an exercise container that has a child
      // widget containing the exercise
      return TextButton(
        child: Text(difficultyStr),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseContainer(
              child: difficultyIndex == 1
                  ? IntermediateExercise(module: module)
                  : const Placeholder(),
            ),
          ),
        ),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(appTheme.textTheme.titleMedium),
          fixedSize: MaterialStateProperty.all(const Size(200.0, 75.0)),
        ),
      );
    }).toList();

    // Now construct the list of all widgets, including spacing and back button
    List<Widget> children = [];
    for (int i = 0; i < buttons.length; i++) {
      children.add(buttons[i]);
      children.add(const SizedBox(height: 25.0));
    }
    children.add(TextButton(
      child: const Text('Back'),
      onPressed: () => Navigator.pop(context),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(appTheme.textTheme.titleMedium),
        fixedSize: MaterialStateProperty.all(const Size(200.0, 75.0)),
      ),
    ));

    return Scaffold(
      backgroundColor: CustomColors.darkPurple,

      // body will contain our custom title bar and the current page
      body: SafeArea(
        child: Container(
          // add some space up top
          padding: const EdgeInsets.only(top: 36),
          child: Column(
            children: [
              const TitleBar('Modules'),
              const SizedBox(height: 25), // This will need to be most likely
              Expanded(child: Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}
