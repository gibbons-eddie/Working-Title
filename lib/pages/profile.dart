import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/profile/profile_section.dart';
import 'package:senior_project/theme.dart';
import 'package:senior_project/profile/profile_sections.dart'
    as profile_sections;
import 'package:sqflite/sqflite.dart';

// Use this function to copy the database from the assets folder to the app's
// database folder or use the existing copy. I'm guessing that if you update
// the database in the assets folder, it won't copy it again, so you'll have to
// delete the existing copy somehow.
Future<Database> _getDatabase() async {
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

// Placeholder method to gather data from SQLite database
Future<Map<String, dynamic>> collectData() async {
  // return Future.delayed(
  //   const Duration(seconds: 3),
  //   () => {
  //     'name': 'Jane Doe',
  //     'completed_modules': 3,
  //     'quickchats_practiced': 28,
  //     'exercises_completed': 43,
  //   },
  // );
  Database db = await _getDatabase();
  final completedModules = (await db
          .rawQuery('SELECT * FROM modules_table WHERE user_completed == 1'))
      .length;
  return {
    'completed_modules': completedModules,
    'quickchats_practiced': 0,
    'exercises_completed': 0,
  };
}

var profile = CustomPage(
  title: 'Profile',
  icon: Icons.portrait,
  child: Container(
    // Take up all possible space
    constraints: const BoxConstraints.expand(),
    margin: const EdgeInsets.only(
      left: 29,
      right: 29,
      bottom: 29,
    ),
    padding: const EdgeInsets.all(32),

    // Add border and background
    decoration: BoxDecoration(
      color: CustomColors.white,
      border: Border.all(
        color: CustomColors.lightGreen,
        width: 5,
      ),
      borderRadius: BorderRadius.circular(65),
    ),
    child: FutureBuilder(
      future: collectData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSection(
                title: 'Statistics',
                child: profile_sections.Statistics(
                    completedModules: snapshot.data['completed_modules'],
                    quickchatsPracticed: snapshot.data['quickchats_practiced'],
                    exercisesCompleted: snapshot.data['exercises_completed']),
              ),
              const SizedBox(height: 24),
              const ProfileSection(
                title: 'Completed Modules',
                child: profile_sections.CompletedModules(),
              ),
            ],
          );
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const Center(
          child: CircularProgressIndicator(
            color: CustomColors.lightGreen,
          ),
        );
      },
    ),
  ),
);
