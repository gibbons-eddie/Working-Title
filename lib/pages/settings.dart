import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void playAudio() {
  final assetsAudioPlayer = AssetsAudioPlayer();
  assetsAudioPlayer.open(Audio("assets/audios/song1.mp3"));
}

var settings = const CustomPage(
  title: 'Settings',
  icon: Icons.settings,
  child: Center(
    child: Text('Setting'),
  ),
);
