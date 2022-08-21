import 'package:flutter/material.dart';
import 'package:gordindev/social_link.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      child: Stack(
        children: [
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                  'assets/batman.png',
                ),
                backgroundColor: Colors.transparent,
              ),
              const Text('Denis Gordin'),
              const Text('Moto'),
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
