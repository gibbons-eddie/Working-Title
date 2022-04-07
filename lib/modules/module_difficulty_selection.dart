import 'package:flutter/material.dart';
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
              Expanded(
                child: Column(
                  children: [
                    TextButton(
                      child: const Text('Beginner'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseContainer(
                            module: module,
                            difficulty: 0,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            appTheme.textTheme.titleMedium),
                        fixedSize:
                            MaterialStateProperty.all(const Size(200.0, 75.0)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                      child: const Text('Intermediate'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseContainer(
                            module: module,
                            difficulty: 1,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            appTheme.textTheme.titleMedium),
                        fixedSize:
                            MaterialStateProperty.all(const Size(200.0, 75.0)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                      child: const Text('Advanced'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseContainer(
                            module: module,
                            difficulty: 2,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            appTheme.textTheme.titleMedium),
                        fixedSize:
                            MaterialStateProperty.all(const Size(200.0, 75.0)),
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      child: const Text('Back'),
                      onPressed: () => Navigator.pop(context),
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            appTheme.textTheme.titleMedium),
                        fixedSize:
                            MaterialStateProperty.all(const Size(200.0, 75.0)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
