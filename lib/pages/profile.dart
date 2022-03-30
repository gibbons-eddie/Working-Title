import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/profile/profile_section.dart';
import 'package:senior_project/profile/stats_block.dart';
import 'package:senior_project/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
    padding: const EdgeInsets.all(49),

    // Add border and background
    decoration: BoxDecoration(
      color: CustomColors.white,
      border: Border.all(
        color: CustomColors.lightGreen,
        width: 5,
      ),
      borderRadius: BorderRadius.circular(65),
    ),

    // Content
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Profile picture + name
      Row(
        children: [
          const Placeholder(
            fallbackHeight: 95,
            fallbackWidth: 95,
          ),
          const SizedBox(width: 23),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test user',
                style: CustomPage.theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              Text(
                'testUser1234',
                style: CustomPage.theme.textTheme.titleSmall,
              ),
            ],
          )
        ],
      ),

      const SizedBox(height: 21),

      // About me
      ProfileSection(
        title: 'About Me',
        child: Text('Bookworm\nNed Stark',
            style: CustomPage.theme.textTheme.bodySmall),
      ),

      const SizedBox(height: 21),

      ProfileSection(
        title: 'Statistics',
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                    flex: 3,
                    child:
                        StatsBlock(value: 3, measurement: 'Completed Modules')),
                Expanded(
                    flex: 3,
                    child: StatsBlock(
                        value: 28, measurement: 'QuickChats Practiced')),
                Expanded(
                    flex: 3,
                    child: StatsBlock(
                        value: 43, measurement: 'Exercises Completed'))
              ],
            ),
            const SizedBox(height: 14),
            LinearPercentIndicator(
              percent: 2 / 3,
              lineHeight: 24,
              progressColor: CustomColors.lightGreen,
              backgroundColor: CustomColors.lightGray,
              animation: true,
              animationDuration: 500,
              barRadius: const Radius.circular(3),
              padding: const EdgeInsets.all(0),
              center: const Text('66% Quickchat Accuracy'),
            ),
          ],
        ),
      ),

      const SizedBox(height: 21),

      const ProfileSection(
        title: 'Completed Modules',
        child: Placeholder(
          fallbackHeight: 10,
        ),
      ),
    ]),
  ),
);
