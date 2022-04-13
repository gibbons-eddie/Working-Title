import 'package:flutter/material.dart';
import 'package:senior_project/intermediate_exercises/subcontainer.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/models/phrase.dart';
import 'package:senior_project/profile/profile_section.dart';
import 'package:senior_project/theme.dart';
import 'package:senior_project/profile/profile_sections.dart'
    as profile_sections;
import 'package:senior_project/util.dart';
import 'package:sqflite/sqflite.dart';

Future<List<Phrase>> _getPhrases(Database db) async {
  // Get incomplete phrases from db
  final List<Map<String, dynamic>> maps;
  maps = await db.query('phrases');

  // Construct and return Phrase objects
  return List.generate(maps.length, (i) => Phrase.fromJson(maps[i]));
}

// Placeholder method to gather data from SQLite database
Future<Map<String, dynamic>> _collectData() async {
  Database db = await getDatabase();

  // Get all phrases
  final phrases = await _getPhrases(db);

  // Determine completed phrases
  final completedPhrases =
      phrases.where((p) => p.completed || p.advancedCompleted).toSet();

  Map<String, dynamic> result = {
    'completedPhrases': completedPhrases,
  };

  // Determine module completion
  for (var i = 0; i < 3; i++) {
    final modulePhrases = phrases.where((p) => p.moduleId == i).toSet();
    var moduleCompletedCount = 0;

    for (final phrase in modulePhrases) {
      if (phrase.completed) moduleCompletedCount++;
      if (phrase.advancedCompleted) moduleCompletedCount++;
    }
    result['module' + (i + 1).toString()] =
        moduleCompletedCount / modulePhrases.length;
  }

  return result;
}

class _RealProfile extends StatefulWidget {
  @override
  _RealProfileState createState() => _RealProfileState();
}

class _RealProfileState extends State<_RealProfile> {
  late Future<Map<String, dynamic>> _data;

  @override
  void initState() {
    _data = _collectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: SubContainer(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // Get module progress
              final List<double> moduleProgress = [
                snapshot.data['module1'],
                snapshot.data['module2'],
                snapshot.data['module3'],
              ];

              // Get completed phrases
              final Set<Phrase> completedPhrases =
                  snapshot.data['completedPhrases'];

              // Calculate completed exercises from completed phrases
              var completedExercises = 0;
              for (final p in completedPhrases) {
                if (p.completed) completedExercises++;
                if (p.advancedCompleted) completedExercises++;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats
                  ProfileSection(
                    title: 'Statistics',
                    child: profile_sections.Statistics(
                      completedModules: moduleProgress
                          .where((element) => element == 1)
                          .length,
                      exercisesCompleted: completedExercises,
                      moduleProgress: moduleProgress,
                    ),
                  ),

                  // Spacing
                  const SizedBox(height: 36),

                  // Completed modules
                  ProfileSection(
                    title: 'Completed Modules',
                    child: profile_sections.CompletedModules(
                        moduleProgress: moduleProgress),
                  ),
                ],
              );
            }

            // Handle error
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // Handle loading
            return const Center(
              child: CircularProgressIndicator(
                color: CustomColors.lightGreen,
              ),
            );
          },
        ),
      ),
    );
  }
}

var profile = CustomPage(
  title: 'Statistics',
  icon: Icons.portrait,
  child: _RealProfile(),
);
