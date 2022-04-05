import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../modules.dart';
import 'package:senior_project/pages/module_pages/phrase_card.dart';

Future<List<Map>> getData() async {
  Database db = await getDatabase();
  return await db.rawQuery('SELECT * FROM phrases_table');
}

class PostAdvancedPage extends StatelessWidget {
  const PostAdvancedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PhraseCard(
              phrase: (snapshot.data as List<Map>)[2]['phrase'], // hardcoded for now for testing
              type: (snapshot.data as List<Map>)[2]['type'],
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
}