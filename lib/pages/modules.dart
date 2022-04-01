import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';

import 'package:senior_project/pages/module_pages/pre_operation_page.dart';
import 'package:senior_project/pages/module_pages/during_operation_page.dart';
import 'package:senior_project/pages/module_pages/post_operation_page.dart';

class ModulesPageChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('Pre Operation'),
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const PreOperationPage()),
                );
              }
            ),
            ElevatedButton(
              child: Text('During Operation'),
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const DuringOperationPage()),
                );
              }
            ),
            ElevatedButton(
              child: Text('Post Operation'),
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const PostOperationPage()),
                );
              }
            ),
          ],
        )
      );
  }
}

class ModulesPage extends CustomPage {
  ModulesPage({Key? key}) : super(
    title: 'Modules',
    icon: Icons.library_books,
    child: ModulesPageChild()
    );
}

var modules = ModulesPage();
