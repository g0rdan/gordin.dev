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
