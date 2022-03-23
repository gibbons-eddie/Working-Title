import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) setCurrentIndex;

  const NavBar({
    Key? key,
    required this.currentIndex,
    required this.setCurrentIndex,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // these should probably be store with the pages data eventually
  final _navOptions = {
    'QuickChat': Icons.chat_bubble,
    'Modules': Icons.library_books,
    'Profile': Icons.portrait,
    'Settings': Icons.settings
  };

  @override
  Widget build(BuildContext context) {
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
