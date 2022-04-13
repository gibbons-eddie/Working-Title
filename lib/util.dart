import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Use this function to copy the database from the assets folder to the app's
// database folder or use the existing copy. I'm guessing that if you update
// the database in the assets folder, it won't copy it again, so you'll have to
// delete the existing copy somehow.
Future<Database> getDatabase() async {
  // Get the path to the database.
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, 'senior_project_app.db');

  // ***** REMOVE THIS IN PRODUCTION *****
  // deleteDatabase(path);

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
