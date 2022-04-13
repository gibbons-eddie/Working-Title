import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/title_bar.dart';
import 'package:senior_project/theme.dart';

class ExerciseContainer extends StatelessWidget {
  final Widget child;

  const ExerciseContainer({Key? key, required this.child}) : super(key: key);

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
              const SizedBox(height: 15), // This will need to be most likely
              child,
              const SizedBox(height: 45),
              TextButton(
                child: const Text('Back'),
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(appTheme.textTheme.titleMedium),
                  fixedSize: MaterialStateProperty.all(const Size(200.0, 50.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
