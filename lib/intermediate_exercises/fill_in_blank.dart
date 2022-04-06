import 'package:flutter/material.dart';
import 'package:senior_project/intermediate_exercises/button_styles.dart';
import 'package:senior_project/intermediate_exercises/subcontainer.dart';

class FillInBlankExercise extends StatefulWidget {
  final String prompt;
  final String correctOption;
  final List<String> options;

  const FillInBlankExercise({
    Key? key,
    required this.prompt,
    required this.options,
    required this.correctOption,
  }) : super(key: key);

  @override
  _FillInBlankExerciseState createState() => _FillInBlankExerciseState();
}

class _FillInBlankExerciseState extends State<FillInBlankExercise> {
  var isAnswered = false;
  var isCorrect = false;
  var selectedOption = '';
  List<String> options = [];

  @override
  initState() {
    var tmp = [...widget.options];
    tmp.shuffle();
    options = tmp;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Construct the list of options
    List<Widget> optionsButtons = options
        .map(
          (option) => TextButton(
            onPressed: () {
              setState(() {
                isAnswered = true;
                selectedOption = option;
                if (option == widget.correctOption) isCorrect = true;
              });
            },
            style: getButtonStyle(option, widget.correctOption, selectedOption,
                isAnswered, isCorrect),
            child: Text(option),
          ),
        )
        .toList();

    return Column(
      children: [
        Text(widget.prompt, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 48),
        Wrap(
          runSpacing: 24,
          children: [...optionsButtons],
        ),
      ],
    );
  }
}
