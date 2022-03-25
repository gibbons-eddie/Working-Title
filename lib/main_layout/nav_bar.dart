import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) setCurrentIndex;
  final List<CustomPage> _pages;

  const NavBar(
      {Key? key,
      required this.currentIndex,
      required this.setCurrentIndex,
      required List<CustomPage> pages})
      : _pages = pages,
        super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final Map<String, IconData> _navOptions = {};

  @override
  Widget build(BuildContext context) {
    // construct our nav options from the pages data
    for (var element in widget._pages) {
      _navOptions[element.title] = element.icon;
    }

    return BottomNavigationBar(
      // map through nav options to get label + icons
      items: _navOptions.entries.map((e) {
        return BottomNavigationBarItem(
          icon: Icon(e.value),
          label: e.key,
        );
      }).toList(),
      currentIndex: widget.currentIndex, // from parent
      onTap: widget.setCurrentIndex, // from parent
    );
  }
}
