/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/widgets/markdown_widget.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/widgets
 * Created Date: Sunday, August 28th 2022, 5:04:10 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownWidget extends StatelessWidget {
  final String mdPath;

  const MarkdownWidget({
    required this.mdPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString(mdPath),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
            onTapLink: (String text, String? href, String title) {
              if (href != null) {
                launchLink(
                  href,
                  isNewTab: true,
                );
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Future<void> launchLink(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }
}
