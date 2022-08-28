/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/routing/app_router.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/routing
 * Created Date: Sunday, August 21st 2022, 6:05:59 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'package:go_router/go_router.dart';
import 'package:gordindev/pages/cv_page.dart';
import 'package:gordindev/pages/main_page.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: [
        GoRoute(
          path: 'cv',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CvPage(),
          ),
        ),
      ],
    ),
  ],
);
