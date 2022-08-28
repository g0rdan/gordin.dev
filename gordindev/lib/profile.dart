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

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[350],
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          // Colors.blue,
          // Colors.red,
          Colors.grey[600]!,
          Colors.grey[350]!,
        ],
      )),
      child: Stack(
        children: [
          Center(
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
              const Text(
                'Denis Gordin',
                style: TextStyle(fontSize: 20),
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
          ))
        ],
      ),
    );
  }
}
