import 'package:flutter/material.dart';
import 'package:senior_project/main_layout/custom_page.dart';

var quickchat = CustomPage(
  title: 'Quickchat',
  icon: Icons.chat_bubble,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('Quickchat'),
      TextButton(onPressed: null, child: Text('Hello world')),
    ],
  ),
);
