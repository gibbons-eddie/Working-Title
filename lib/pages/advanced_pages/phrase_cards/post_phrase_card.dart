import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';

import '../../modules.dart';
import 'package:senior_project/pages/module_pages/post_operation_page.dart';
import 'package:senior_project/pages/advanced_pages/post_advanced.dart';

import 'package:senior_project/models/phrase.dart';

class PostPhraseCard extends StatefulWidget {
  String phrase;
  String type;
  String audioFileName;
  int currentIndex;
  void Function(String, String, String) setPhrase;
  void Function(int) setCurrentIndex;
  // var list = phrases();
  // List<Phrase> list2 = list2;

  PostPhraseCard(
      {Key? key,
      required this.phrase,
      required this.type,
      required this.audioFileName,
      required this.currentIndex,
      required this.setPhrase,
      required this.setCurrentIndex})
      : super(key: key);

  @override
  State<PostPhraseCard> createState() => _PostPhraseCardState();
}

class _PostPhraseCardState extends State<PostPhraseCard> {
  final String currentModule = PostOperationPage().module;
  final String currentDiff = PostAdvancedPage().diff;

  TextEditingController myTextController = TextEditingController();
  String currentText = "";

  Future<List<Phrase>> phrases() async {
    final db = await getDatabase();

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM phrases_table WHERE module_name = ?', [currentModule]);

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
    print(currentModule);
    print(currentDiff);

    String modFolder = "";

    if (currentModule == 'Pre-Operation')
    {
      modFolder = "module1/";
    }
    else if (currentModule == 'During Operation')
    {
      modFolder = "module2/";
    }
    else if (currentModule == 'Post-Operation')
    {
      modFolder = "module3/";
    }

    AudioCache cache = new AudioCache();

    return await cache.play('recordings/' + modFolder + widget.audioFileName);
  }

  onForward(List<Phrase> tempList) {
    if (widget.currentIndex < 2) {
      widget.setCurrentIndex(widget.currentIndex + 1);
      widget.setPhrase(tempList[widget.currentIndex + 1].phrase,
          tempList[widget.currentIndex + 1].type,
          tempList[widget.currentIndex + 1].audioFileName);
    }
  }

  onBack(List<Phrase> tempList) {
    if (widget.currentIndex != 0) {
      widget.setCurrentIndex(widget.currentIndex - 1);
      widget.setPhrase(tempList[widget.currentIndex - 1].phrase,
          tempList[widget.currentIndex - 1].type,
          tempList[widget.currentIndex - 1].audioFileName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Phrase>>(
      future: phrases(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
              child: Card(
                  child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.album),
                title: Text("What is this phrase?"),
                subtitle: Text(widget.type)
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: TextField(
                        controller:
                            myTextController, // gives error for some reason
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
                          //print(currentText);
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
                  if (currentText == widget.phrase) {
                    print("matched");
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Matched',
                            style:
                                TextStyle(color: Colors.green, fontSize: 25)),
                        content: const Text(
                            'Your input matches the phrase your are hearing.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    print("not match");
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Not Match',
                            style: TextStyle(color: Colors.red, fontSize: 25)),
                        content: const Text(
                            'Your input dose not matche the phrase your are hearing.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                  //
                },
                child: Text('Submit'),
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
                      onPressed: () {
                        onBack(snapshot.data ?? []);
                      },
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
                      onPressed: () {
                        onForward(snapshot.data ?? []);
                      },
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                      color: Colors.white,
                      padding: EdgeInsets.only(right: 20),
                    ),
                  ),
                ],
              )
            ],
          )));
        } else if (snapshot.hasError) {
          print("ERROR");
          return Text('Error: ${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
