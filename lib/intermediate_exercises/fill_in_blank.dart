import 'package:flutter/material.dart';
import 'package:senior_project/intermediate_exercises/button_styles.dart';
import 'package:senior_project/models/phrase.dart';
import 'package:senior_project/models/phrase_option.dart';

class FillInBlankExercise extends StatefulWidget {
  final Phrase phrase;
  final List<PhraseOption> options;

  const FillInBlankExercise({
    Key? key,
    required this.phrase,
    required this.options,
  }) : super(key: key);

  @override
  _FillInBlankExerciseState createState() => _FillInBlankExerciseState();
}

class _FillInBlankExerciseState extends State<FillInBlankExercise> {
  var isCorrect = false;
  PhraseOption? selectedOption;
  List<PhraseOption> options = [];
  late PhraseOption correctOption =
      options.firstWhere((element) => element.correct);

  @override
  initState() {
    // Shuffle options
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
          (item) => TextButton(
            onPressed: () {
              setState(() {
                selectedOption = item;
                if (item == correctOption) isCorrect = true;
              });
            },
            style:
                getButtonStyle(item, correctOption, selectedOption, isCorrect),
            child: Text(item.option),
          ),
        )
        .toList();

    return Column(
      children: [
        Text(widget.phrase.prompt, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 48),
        Wrap(
          runSpacing: 24,
          children: [...optionsButtons],
        ),
      ],
    );
  }
}
