/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/pages/cv_page.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/pages
 * Created Date: Sunday, August 21st 2022, 6:08:04 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'package:flutter/material.dart';
import 'package:gordindev/cv.dart';
import 'package:gordindev/profile.dart';

class CvPage extends StatefulWidget {
  const CvPage({Key? key}) : super(key: key);

  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
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
            child: Cv(),
          ),
        ],
      ),
    );
  }
}
