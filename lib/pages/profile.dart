import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/profile/profile_section.dart';
import 'package:senior_project/theme.dart';
import 'package:senior_project/profile/profile_sections.dart'
    as profile_sections;

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

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        profile_sections.Header(),
        SizedBox(height: 24),
        ProfileSection(
          title: 'Statistics',
          child: profile_sections.Statistics(),
        ),
        SizedBox(height: 24),
        ProfileSection(
          title: 'Completed Modules',
          child: profile_sections.CompletedModules(),
        ),
      ],
    ),
  ),
);
