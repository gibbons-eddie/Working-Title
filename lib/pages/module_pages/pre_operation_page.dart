import 'package:flutter/material.dart';

class PreOperationPage extends StatelessWidget {
  const PreOperationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre Operation Page'),
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
              // Navigator.pop(context); // to go to previous widget in tree (in this case, modules page)
              }, child: Text("Advanced"),
            ),
          ],
        )
      ),
    );
  }
}