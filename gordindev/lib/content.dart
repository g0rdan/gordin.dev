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
