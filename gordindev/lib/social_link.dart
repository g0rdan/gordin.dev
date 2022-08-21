import 'package:flutter/material.dart';
import 'dart:js' as js;

enum SocialLinkType { linkedin, github, twitter }

class SocialLink extends StatelessWidget {
  const SocialLink({
    required this.type,
    Key? key,
  }) : super(key: key);

  final SocialLinkType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        js.context.callMethod('open', [_getURL(type)]);
      },
      child: CircleAvatar(
        radius: 16.0,
        backgroundImage: AssetImage(_getIconPath(type)),
        backgroundColor: Colors.green,
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
}