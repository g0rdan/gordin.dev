import 'package:flutter/material.dart';
import 'package:gordindev/content.dart';
import 'package:gordindev/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            flex: 3,
            child: Profile(),
          ),
          Expanded(
            flex: 7,
            child: Content(),
          ),
        ],
      ),
    );
  }
}
