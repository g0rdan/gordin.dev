/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/profile.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib
 * Created Date: Monday, August 8th 2022, 9:46:07 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'package:flutter/material.dart';
import 'package:gordindev/social_link.dart';

const double _animatedPaddinOffset = 30.0;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late final _controller = AnimationController(
    value: 0.0,
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.animateTo(1.0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.grey[600]!,
          Colors.grey[350]!,
        ],
      )),
      child: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                if (child == null) return const SizedBox.shrink();
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: _animatedPaddinOffset -
                        (_animatedPaddinOffset * _controller.value),
                  ),
                  child: Opacity(
                    opacity: _controller.value,
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage(
                      'assets/photo.jpg',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SelectionArea(
                    child: Text(
                      'Denis Gordin',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 10,
                    children: const [
                      SocialLink(type: SocialLinkType.github),
                      SocialLink(type: SocialLinkType.linkedin),
                      SocialLink(type: SocialLinkType.twitter),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
