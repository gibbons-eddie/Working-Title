import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); // always needs main function in this file; 'runApp' for Flutter applications

class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Senior Project Sample';

  @override
  Widget build(BuildContext context) { // 'build' is the root of the whole application/widget tree here
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(), // more can go here, basically sets how the app is organized
    );
  }
}

class MyStatefulWidget extends StatefulWidget { // widgets are either stateful or stateless; more info here: https://docs.flutter.dev/development/ui/interactive
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(); // a widget's state represents essentially the dynamic parts of the widget; whenever widget changes are made, setState() is called that updates the widget
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Quickchat',
      style: optionStyle,
    ),
    Text(
      'Modules',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) { // again, basically all the interactive parts of the widget; in this case, the menu bar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Senior Project App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Quickchat',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Modules',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}