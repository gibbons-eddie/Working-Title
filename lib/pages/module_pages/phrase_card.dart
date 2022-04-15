import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';

import '../modules.dart';
import 'package:senior_project/pages/module_pages/post_operation_page.dart';
import 'package:senior_project/pages/difficulty_pages/post_advanced.dart';

import 'package:senior_project/models/phrase.dart';

class PhraseCard extends StatelessWidget {
  String phrase;
  String type;
  int currentIndex;
  // var list = phrases();
  TextEditingController myTextController = TextEditingController();

  String currentText = "";

  final String currentModule = PostOperationPage().module;
  final String currentDiff = PostAdvancedPage().diff;
  // List<Phrase> list2 = list2;

  PhraseCard({Key? key, required this.phrase, required this.type, required this.currentIndex})
      : super(key: key);

  Future<List<Phrase>> phrases() async {
    final db = await getDatabase();

    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM phrases_table WHERE module_name = ?',
      [currentModule]);

    return List.generate(maps.length, (i) {
      return Phrase(
        id: maps[i]['ID'],
        phrase: maps[i]['phrase'],
        type: maps[i]['type'],
        moduleName: maps[i]['module_name'],
        difficultyLevel: maps[i]['difficulty_level'],
        audioFileName: maps[i]['audio_file_name'],
      );
    });
  }

  Future<AudioPlayer> playLocalAsset() async {
    // Database db = await getDatabase();
    // print(list2[currentIndex].phrase);

    // print(list2.length);

    print(currentModule);
    print(currentDiff);

    AudioCache cache = new AudioCache();

    return await cache.play("recordings/" + "module3/" + "phrase01.mp3");
  }

  onForward() {
    if (currentIndex < 2) {
      currentIndex += 1;
    }
    getPhraseInfo(currentIndex);
  }

  onBack() {
    if (currentIndex != 0) {
      currentIndex -= 1;
    }
    getPhraseInfo(currentIndex);
  }

  void getPhraseInfo(int index) async { // prints correct info as you page through the phrases
    var tempList = await phrases();
    var phraseType = tempList[currentIndex].type;
    type = phraseType;
    var phraseAudio = tempList[currentIndex].audioFileName;
    var phraseName = tempList[currentIndex].phrase;
    phrase = phraseName;
    print(currentIndex);
    print(phrase);
    print(type);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.album),
          title: Text(phrase), 
          subtitle: Text(currentIndex.toString()), // still just shows '0'
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                await playLocalAsset();
              }, // needs to play audio file
              child: const Text('Play'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: TextField(
                  controller: myTextController, // gives error for some reason
                  autofocus: true,
                  onChanged: (inputValue) {
                    // if (inputValue.isEmpty) {
                    //  currentText = "empty";
                    //} else {
                    //  currentText = "not empty";
                    //}
                    currentText = inputValue.toString();
                    //myTextController.text = inputValue;
                    //var chr = str[0];
                    //str = str.substring(1) + chr;
                    //myTextController.text = str;
                    print(currentText);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),

                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () async {
            // 
          },
          child: Text('Submit'),
        ),
        Text(
          currentText,
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Ink(
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.lightBlue,
            ),
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {onBack();},
              icon: const Icon(Icons.arrow_back_ios_outlined),
              color: Colors.white,
              padding: EdgeInsets.only(left: 20),
              ),
            ),
            Ink(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.lightBlue,
              ),
              padding: EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: () {onForward();},
                icon: const Icon(Icons.arrow_forward_ios_outlined),
                color: Colors.white,
                padding: EdgeInsets.only(right: 20),
                ),
            ),
          ],
        )
      ],
    )));
  }
}
