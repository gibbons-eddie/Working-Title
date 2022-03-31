import 'package:flutter/material.dart';

class DuringOperationPage extends StatelessWidget {
  const DuringOperationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('During Operation Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          }, child: const Text("Go back to Modules page!"),
        ),
      ),
    );
  }
}