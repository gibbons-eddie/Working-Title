import 'package:flutter/material.dart';
import 'package:senior_project/pages/module_pages/beginner_pages/pre_operation_page_flashcards.dart';


class PreOperationBeginner extends StatelessWidget {
  const PreOperationBeginner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beginner Exercises'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Container>[
            Container(
              margin: const EdgeInsets.all(20.0),
              child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const FlashCardsBeginnerPre()),
                );
                }, child: Text("Flashcards"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: ElevatedButton(
              onPressed: () {
                // Navigator.pop(context); // to go to previous widget in tree (in this case, modules page)
                }, child: Text("Vocab Matching"),
              ),
            ),
          ],
        )
      ),
    );
  }
}