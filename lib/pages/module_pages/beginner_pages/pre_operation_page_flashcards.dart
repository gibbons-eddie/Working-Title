import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashCardsBeginner extends StatelessWidget {
  const FlashCardsBeginner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <FlipCard>[
              FlipCard(
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                direction: FlipDirection.HORIZONTAL, // default
                front: Container(
                  child: Text('Front'),
                ),
                back: Container(
                  child: Text('Back'),
                ),
              ),

          ],
        )
      ),
    );
  }
}