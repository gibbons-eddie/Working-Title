import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:senior_project/intermediate_exercises/button_styles.dart';
import 'package:senior_project/models/phrase.dart';
import 'package:senior_project/models/phrase_option.dart';
import 'package:sqflite/sqflite.dart';

class FillInBlankExercise extends StatefulWidget {
  final Phrase phrase;
  final List<PhraseOption> options;
  final Function reactToAnswer;

  const FillInBlankExercise(
      {Key? key,
      required this.phrase,
      required this.options,
      required this.reactToAnswer})
      : super(key: key);

  @override
  _FillInBlankExerciseState createState() => _FillInBlankExerciseState();
}

class _FillInBlankExerciseState extends State<FillInBlankExercise> {
  var isCorrect = false;
  PhraseOption? selectedOption;
  List<PhraseOption> options = [];
  late PhraseOption correctOption;

  @override
  initState() {
    isCorrect = false;
    selectedOption = null;
    options = [];

    // Shuffle options
    var tmp = [...widget.options];
    tmp.shuffle();
    options = tmp;
    correctOption = options.firstWhere((element) => element.correct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Construct the list of options
    List<Widget> optionsButtons = options
        .map(
          (item) => TextButton(
            onPressed: () async {
              // Update item as completed in db
              if (item == correctOption) {
                final db = await openDatabase(
                    join(await getDatabasesPath(), 'senior_project_app.db'));
                await db.update('phrases', {'completed': 1},
                    where: 'id = ?', whereArgs: [widget.phrase.id]);
              }

              // Set the widget state
              setState(() {
                selectedOption = item;
                if (item == correctOption) isCorrect = true;
              });

              await Future.delayed(const Duration(seconds: 2));
              widget.reactToAnswer();
              initState();
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
