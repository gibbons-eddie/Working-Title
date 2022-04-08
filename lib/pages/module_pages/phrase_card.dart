import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';

import '../modules.dart';
import 'package:senior_project/pages/module_pages/phrase_card.dart';

class PhraseCard extends StatelessWidget {
  final String phrase;
  final String type;

  var myTextController = TextEditingController();

  PhraseCard({Key? key, required this.phrase, required this.type})
      : super(key: key);

  Future<AudioPlayer> playLocalAsset() async {
    Database db = await getDatabase();
    var list = await db.query('phrases_table', columns: ['module_name']);

    int l = list.length;
    var mod = [];
    for (int i = 0; i < l; i++) {
      if (list[i].values.toString() == "(Pre-Operation)") {
        mod.add("module1/");
      } else if (list[i].values.toString() == "(During Operation)") {
        mod.add("module2/");
      } else if (list[i].values.toString() == "(Post-Operation)") {
        mod.add("module3/");
      }
    }
    print(list[0].values.toString());
    print(list);

    print(mod[0]);

    AudioCache cache = new AudioCache();

    return await cache.play("recordings/" + mod[2] + "phrase01.mp3");
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
          title: Text("What is this phrase?"), // used to show phrase
          subtitle: Text(type),
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: TextField(
                  // controller: myTextController, // gives error for some reason
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
                // await playLocalAsset();
              }, // needs to play audio file
              child: const Text('Submit'),
            ),
      ],
    )));
  }
}
