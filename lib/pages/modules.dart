import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/pages/module_pages/pre_operation_page.dart';
import 'package:senior_project/pages/module_pages/during_operation_page.dart';
import 'package:senior_project/pages/module_pages/post_operation_page.dart';
import 'package:senior_project/pages/module_pages/vocab_card.dart';
import 'package:sqflite/sqflite.dart';

// Use this function to copy the database from the assets folder to the app's
// database folder or use the existing copy. I'm guessing that if you update
// the database in the assets folder, it won't copy it again, so you'll have to
// delete the existing copy somehow.
Future<Database> getDatabase() async {
  // Get the path to the database.
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, 'senior_project_app.db');

  // Check if the database exists.
  var exists = await databaseExists(path);

  // Make a copy from the asset folder.
  if (!exists) {
    if (kDebugMode) print('Creating new copy from asset.');

    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset.
    ByteData data =
        await rootBundle.load(join('assets/db', 'senior_project_app.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written.
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    if (kDebugMode) print('Opening existing database.');
  }

  return await openDatabase(path);
}

// Use this function to get some data from the database.
Future<List<Map>> getData() async {
  Database db = await getDatabase();
  return await db.rawQuery('SELECT * FROM vocab_table');
}

class ModulesPageChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ElevatedButton(
              child: Text('Pre Operation'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PreOperationPage()),
                );
              }),
          ElevatedButton(
              child: Text('During Operation'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DuringOperationPage()),
                );
              }),
          ElevatedButton(
              child: Text('Post Operation'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostOperationPage()),
                );
              }),

          // The below widget will render a VocabCard for the first row of the
          // result from the database query (see the getData function above).
          // We should probably have better type safety somehow instead of
          // doing "snapshot.data as a List<Map>" but for now this works.
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return VocabCard(
                    term: (snapshot.data as List<Map>)[0]['term'],
                    definition: (snapshot.data as List<Map>)[0]['def']);
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}

class ModulesPage extends CustomPage {
  ModulesPage({Key? key})
      : super(
            title: 'Modules',
            icon: Icons.library_books,
            child: ModulesPageChild());
}

var modules = ModulesPage();
