/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/social_link.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib
 * Created Date: Monday, August 8th 2022, 8:37:37 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialLinkType {
  linkedin,
  github,
  twitter,
}

class SocialLink extends StatelessWidget {
  const SocialLink({
    required this.type,
    Key? key,
  }) : super(key: key);

  final SocialLinkType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await launchLink(_getURL(type)),
      child: CircleAvatar(
        radius: 16.0,
        backgroundImage: AssetImage(_getIconPath(type)),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  String _getURL(SocialLinkType linkType) {
    switch (linkType) {
      case SocialLinkType.github:
        return 'https://github.com/g0rdan';
      case SocialLinkType.linkedin:
        return 'https://www.linkedin.com/in/denis-gordin/';
      case SocialLinkType.twitter:
        return 'https://twitter.com/g0rdan';
      default:
        return '';
    }
  }

  String _getIconPath(SocialLinkType linkType) {
    switch (linkType) {
      case SocialLinkType.github:
        return 'assets/github_icon_48.png';
      case SocialLinkType.linkedin:
        return 'assets/linkedin_icon_48.png';
      case SocialLinkType.twitter:
        return 'assets/twitter_icon_48.png';
      default:
        return '';
    }
  }

  Future<void> launchLink(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }
}
