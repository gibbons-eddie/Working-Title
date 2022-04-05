import 'package:flutter/material.dart';

import 'package:senior_project/pages/difficulty_pages/post_advanced.dart';

class PostOperationPage extends StatelessWidget {
  const PostOperationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Operation Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
            onPressed: () {
              // Navigator.pop(context); // to go to previous widget in tree (in this case, modules page)
              }, child: Text("Beginner"),
            ),
            ElevatedButton(
            onPressed: () {
              // Navigator.pop(context); // to go to previous widget in tree (in this case, modules page)
              }, child: Text("Intermediate"),
            ),
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostAdvancedPage()),
                );
              }, child: Text("Advanced"),
            ),
          ],
        )
      ),
    );
  }
}