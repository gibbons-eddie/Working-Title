import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class PhraseCard extends StatelessWidget {
  final String phrase;
  final String type;

  PhraseCard({Key? key, required this.phrase, required this.type}) : super(key: key);

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();

    return await cache.play("phrase01.mp3");
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
              ],
            )
          ],
        )
      )
    );
  }
}