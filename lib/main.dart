import 'package:flutter/material.dart';

import 'candi_search_screen.dart';
import 'candi_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candi',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: CandiSearchScreen(),
    );
  }
}
