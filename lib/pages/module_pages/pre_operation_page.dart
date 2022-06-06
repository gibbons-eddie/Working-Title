import 'package:flutter/material.dart';
import 'package:senior_project/pages/module_pages/beginner_pages/pre_operation_page_beginner.dart';

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
          children: <Container>[
            Container(
              margin: const EdgeInsets.all(20.0),
              child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const PreOperationBeginner()),
                );
                }, child: Text("Beginner"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const PreOperationBeginner()),
                  );
                }, child: Text("Intermediate"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: ElevatedButton(
              onPressed: () {
                // Navigator.pop(context); // to go to previous widget in tree (in this case, modules page)
                }, child: Text("Advanced"),
              ),
            ),
          ],
        )
      ),
    );
  }
}