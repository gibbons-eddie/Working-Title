import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:senior_project/intermediate_exercises/fill_in_blank.dart';
import 'package:senior_project/intermediate_exercises/subcontainer.dart';
import 'package:senior_project/models/module.dart';
import 'package:senior_project/models/phrase.dart';
import 'package:senior_project/models/phrase_option.dart';
import 'package:sqflite/sqflite.dart';

class IntermediateExercise extends StatefulWidget {
  final Module module;

  const IntermediateExercise({Key? key, required this.module})
      : super(key: key);

  @override
  _IntermediateExerciseState createState() => _IntermediateExerciseState();
}

class _IntermediateExerciseState extends State<IntermediateExercise> {
  Future<Phrase> _getPhrase(Database db, int moduleId,
      {avoidCompleted = false}) async {
    // Get a random phrase
    final List<Map<String, dynamic>> maps;
    if (avoidCompleted) {
      maps = await db.query(
        'phrases',
        where: 'module_id = ? and completed = 0',
        whereArgs: [moduleId],
      );
    } else {
      maps = await db
          .query('phrases', where: 'module_id = ?', whereArgs: [moduleId]);
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
    return FutureBuilder<List>(
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
    );
  }
}
