/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/pages/main_page.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/pages
 * Created Date: Sunday, August 21st 2022, 6:07:44 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'package:flutter/material.dart';
import 'package:gordindev/profile.dart';
import 'package:gordindev/widgets/markdown_widget.dart';

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
            child: MarkdownWidget(
              mdPath: 'md/cv.md',
            ),
          ),
        ],
      ),
    );
  }
}
