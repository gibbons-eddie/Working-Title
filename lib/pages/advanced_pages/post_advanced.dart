import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../modules.dart';
import 'package:senior_project/pages/module_pages/post_operation_page.dart';
import 'package:senior_project/pages/advanced_pages/phrase_cards/post_phrase_card.dart';

import 'package:senior_project/models/phrase.dart';

class PostAdvancedPage extends StatefulWidget {
  final String diff = 'Advanced';
  // int index = 0;
  // static List<Phrase> list2;
  
  PostAdvancedPage({Key? key}) : super(key: key);

  @override
  State<PostAdvancedPage> createState() => _PostAdvancedState();
}

class _PostAdvancedState extends State<PostAdvancedPage> {
  int _currentIndex = 0;
  String _currentPhrase = "";
  String _currentType = "";
  String _currentAudioFileName = "";

  final String currentModule = PostOperationPage().module;

  Future<List<Map>> getData() async {
    Database db = await getDatabase();
    return await db.rawQuery('SELECT * FROM phrases_table WHERE module_name = ?',
      [currentModule]);
  }

  void setCurrentIndex(int _newIndex) {
    setState(() {
      _currentIndex = _newIndex;
    });
  }

  void setPhrase(String _newPhrase, String _newType, String _newAudioFileName) {
    setState(() {
      _currentPhrase = _newPhrase;
      _currentType = _newType;
      _currentAudioFileName = _newAudioFileName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PostAdvancedPage().diff),
        backgroundColor: Colors.green,
      ),
      body: PostPhraseCard( // where the info needs to be updated
              phrase: _currentPhrase,
              type: _currentType,
              audioFileName: _currentAudioFileName,
              currentIndex: _currentIndex,
              setPhrase: setPhrase,
              setCurrentIndex: setCurrentIndex,
      ),
    );
  }
}