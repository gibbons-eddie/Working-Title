import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/profile/profile_section.dart';
import 'package:senior_project/theme.dart';
import 'package:senior_project/profile/profile_sections.dart'
    as profile_sections;

// Placeholder method to gather data from SQLite database
Future collectData() {
  return Future.delayed(
    const Duration(seconds: 3),
    () => {
      'name': 'Jane Doe',
      'completed_modules': 3,
      'quickchats_practiced': 28,
      'exercises_completed': 43,
    },
  );
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
              profile_sections.Header(name: snapshot.data['name']),
              const SizedBox(height: 24),
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
