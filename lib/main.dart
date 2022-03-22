import 'package:flutter/material.dart';
import 'package:flutter_demo/theme.dart';

void main() => runApp(
    const MyApp()); // always needs main function in this file; 'runApp' for Flutter applications

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Senior Project Sample';

  @override
  Widget build(BuildContext context) {
    // 'build' is the root of the whole application/widget tree here
    return MaterialApp(
      title: _title,
      theme: appTheme,
      home:
          const MyStatefulWidget(), // more can go here, basically sets how the app is organized
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  // widgets are either stateful or stateless; more info here: https://docs.flutter.dev/development/ui/interactive
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() =>
      _MyStatefulWidgetState(); // a widget's state represents essentially the dynamic parts of the widget; whenever widget changes are made, setState() is called that updates the widget
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final _navOptions = {
    'QuickChat': Icons.chat_bubble,
    'Modules': Icons.library_books,
    'Profile': Icons.portrait,
    'Settings': Icons.settings
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // again, basically all the interactive parts of the widget; in this case, the menu bar

    return Scaffold(
      appBar: AppBar(
        title: const Text('Senior Project App'),
      ),
      body: Center(
        child: Text(_navOptions.entries.elementAt(_selectedIndex).key,
            style: Theme.of(context).textTheme.headline1),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navOptions.entries.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(e.value),
            label: e.key,
          );
        }).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
