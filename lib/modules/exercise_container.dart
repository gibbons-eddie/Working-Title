import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:senior_project/intermediate_exercises/fill_in_blank.dart';
import 'package:senior_project/intermediate_exercises/subcontainer.dart';
import 'package:senior_project/main_layout/title_bar.dart';
import 'package:senior_project/models/module.dart';
import 'package:senior_project/models/phrase.dart';
import 'package:senior_project/models/phrase_option.dart';
import 'package:senior_project/theme.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseContainer extends StatefulWidget {
  final Module module;
  final int difficulty;

  const ExerciseContainer(
      {Key? key, required this.module, required this.difficulty})
      : super(key: key);

  @override
  _ExerciseContainerState createState() => _ExerciseContainerState();
}

class _ExerciseContainerState extends State<ExerciseContainer> {
  Future<Phrase> _getPhrase(Database db, int moduleId,
      {avoidCompleted = true}) async {
    // Get a random phrase
    final List<Map<String, dynamic>> maps;
    if (avoidCompleted == true) {
      maps = await db
          .query('phrases', where: 'completed = ?', whereArgs: [moduleId]);
    } else {
      maps = await db.query('phrases');
    }
    final map = maps[Random().nextInt(maps.length)];

    // Construct Phrase object
    return Phrase.fromJson(map);
  }

  Future<List<PhraseOption>> _getPhraseOptions(
      Database db, int phraseId) async {
    final List<Map<String, dynamic>> maps = await db
        .query('phrase_options', where: 'phrase_id = ?', whereArgs: [phraseId]);
    var optionsList =
        List.generate(maps.length, (i) => PhraseOption.fromJson(maps[i]));
    optionsList.shuffle();

    return optionsList;
  }

  Future<List> _getData() async {
    final db = await openDatabase(
        join(await getDatabasesPath(), 'senior_project_app.db'));
    final phrase = await _getPhrase(db, widget.module.id);
    final options = await _getPhraseOptions(db, phrase.id);
    return [phrase, options];
  }

  late Future<List> _data;

  @override
  void initState() {
    _data = _getData();
    super.initState();
  }

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
              FutureBuilder<List>(
                future: _data,
                builder: (_, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.hasData) {
                    Phrase phrase = snapshot.data![0];
                    List<PhraseOption> options = snapshot.data![1];

                    return SubContainer(
                      child: FillInBlankExercise(
                        phrase: phrase,
                        options: options,
                        reactToAnswer: () {
                          setState(() {
                            _data = _getData();
                          });
                        },
                      ),
                    );
                  }

                  return const Text('No data');
                },
              ),
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
