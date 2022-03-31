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
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          }, child: const Text("Go back to Modules page!"),
        ),
      ),
    );
  }
}