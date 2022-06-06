import 'package:flutter/material.dart';

import 'package:senior_project/pages/advanced_pages/pre_advanced.dart';

class PreOperationPage extends StatelessWidget {
  final String module = 'Pre-Operation';
  
  PreOperationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Operation Page'),
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
                  builder: (context) => PreAdvancedPage()),
                );
              }, child: Text("Advanced"),
            ),
          ],
        )
      ),
    );
  }
}