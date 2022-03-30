import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:english_words/english_words.dart';

var settings = CustomPage(
  title: 'Settings',
  icon: Icons.settings,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      Text(
        'Study Summary',
        style: TextStyle(color: Colors.white, fontSize: 21),
      ),
      Divider(color: Colors.white),
      Text(
        'Overall Performance',
        style: TextStyle(color: Colors.white, fontSize: 21),
      ),
      Divider(color: Colors.white),
      Text(
        'Saved Modules',
        style: TextStyle(color: Colors.white, fontSize: 21),
      ),
      Divider(color: Colors.white),
      Text(
        'Volume Setting',
        style: TextStyle(color: Colors.white, fontSize: 21),
      ),
      Divider(color: Colors.white),
      Text(
        'Privacy Setting',
        style: TextStyle(color: Colors.white, fontSize: 21),
      ),
      Divider(color: Colors.white),
      Text(
        'About',
        style: TextStyle(color: Colors.white, fontSize: 21),
      ),
    ],
  ),
);
