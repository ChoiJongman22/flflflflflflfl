import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  static const routeName = '/home-screens';
  @override
  State<StatefulWidget> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("Flume Ride"),
      ),
    );
  }
}
