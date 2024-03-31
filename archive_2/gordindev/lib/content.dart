/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/content.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib
 * Created Date: Sunday, August 7th 2022, 5:11:59 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: MaterialButton(
          child: const Text('CV'),
          onPressed: () => context.go('/cv'),
        ),
      ),
    );
  }
}
