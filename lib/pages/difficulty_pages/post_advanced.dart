import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../modules.dart';
import 'package:senior_project/pages/module_pages/post_operation_page.dart';
import 'package:senior_project/pages/module_pages/phrase_card.dart';

import 'package:senior_project/models/phrase.dart';

class PostAdvancedPage extends StatefulWidget {
  final String diff = 'Advanced';
  final String currentModule = PostOperationPage().module;
  int index = 0;
  // static List<Phrase> list2;

  Future<List<Map>> getData() async {
    Database db = await getDatabase();
    return await db.rawQuery('SELECT * FROM phrases_table WHERE module_name = ?',
      [currentModule]);
  }
  
  PostAdvancedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diff),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PhraseCard(
              phrase: (snapshot.data as List<Map>)[index]['phrase'], // hardcoded for now for testing
              type: (snapshot.data as List<Map>)[index]['type'],
              currentIndex: index,
            );
          }
          if (snapshot.hasError) {
            print("ERROR");
            return Text('Error: ${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}