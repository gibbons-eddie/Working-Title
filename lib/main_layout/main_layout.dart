import 'package:flutter/material.dart';
import 'package:senior_project/theme.dart';
import 'package:senior_project/main_layout/custom_page.dart';
import 'package:senior_project/main_layout/nav_bar.dart';
import 'package:senior_project/main_layout/title_bar.dart';
import 'package:senior_project/main_layout/pages.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0; // keep track of which page we're on
  final List<CustomPage> _pages = [quickchat, modules, profile, settings];

  void setCurrentIndex(int _newIndex) {
    setState(() {
      _currentIndex = _newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    // using built-in scaffold for convenience
    return Scaffold(
      backgroundColor: CustomColors.darkPurple,

      // custom navigation bar widget
      bottomNavigationBar: NavBar(
        currentIndex: _currentIndex,
        setCurrentIndex: setCurrentIndex,
        pages: _pages,
      ),

      // body will contain our custom title bar and the current page
      body: SafeArea(
        child: Container(
          // add some space up top
          padding: const EdgeInsets.only(top: 36),
          child: Column(
            children: [
              TitleBar(_pages[_currentIndex].title),
              const SizedBox(height: 15), // This will need to be most likely
              Expanded(
                child: _pages[_currentIndex],
              )
            ],
          ),
        ),
      ),
    );
  }
}
