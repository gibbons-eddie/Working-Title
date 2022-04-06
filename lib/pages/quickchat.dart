import 'dart:math';
import 'package:flutter/material.dart';
import 'package:senior_project/intermediate_exercises/fill_in_blank.dart';
import 'package:senior_project/intermediate_exercises/subcontainer.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/models/phrase.dart';
import 'package:senior_project/models/phrase_option.dart';
import 'package:senior_project/pages/modules.dart';
import 'package:sqflite/sqflite.dart';

Future<Phrase> _getPhrase(Database db, {avoidCompleted = true}) async {
  // Get a random phrase
  final List<Map<String, dynamic>> maps;
  if (avoidCompleted == true) {
    maps = await db.query('phrases', where: 'completed = ?', whereArgs: [0]);
  } else {
    maps = await db.query('phrases');
  }
  final map = maps[Random().nextInt(maps.length)];

  // Construct Phrase object
  return Phrase(
    id: map['id'],
    phrase: map['phrase'],
    prompt: map['prompt'],
    audioFile: map['audio_file'],
    completed: map['completed'] == 1,
    advancedCompleted: map['advanced_completed'] == 1,
    moduleId: map['module_id'],
  );
}

Future<List<PhraseOption>> _getOptions(Database db, int phraseId) async {
  final List<Map<String, dynamic>> maps = await db
      .query('phrase_options', where: 'phrase_id = ?', whereArgs: [phraseId]);
  var optionsList = List.generate(maps.length, (i) {
    return PhraseOption(
      id: maps[i]['id'],
      option: maps[i]['option'],
      correct: maps[i]['correct'] == 1,
      advanced: maps[i]['advanced'] == 1,
      phraseId: maps[i]['phrase_id'],
    );
  });
  optionsList.shuffle();

  return optionsList;
}

Future<List> _getData() async {
  final db = await getDatabase();
  final phrase = await _getPhrase(db);
  final options = await _getOptions(db, phrase.id);
  return [phrase, options];
}

var quickchat = CustomPage(
  title: 'Quickchat',
  icon: Icons.chat_bubble,
  child: FutureBuilder<List>(
    future: _getData(),
    builder: (_, snapshot) {
      if (snapshot.hasData) {
        Phrase phrase = snapshot.data![0];
        List<PhraseOption> options = snapshot.data![1];

        return Column(
          children: [
            SubContainer(
              child: FillInBlankExercise(
                prompt: phrase.prompt,
                options: options.map((item) => item.option).toList(),
                correctOption:
                    options.where((item) => item.correct).first.option,
              ),
            ),
            Text('Return to modules'),
          ],
        );
      }
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      return const Center(child: CircularProgressIndicator());
    },
  ),
);
