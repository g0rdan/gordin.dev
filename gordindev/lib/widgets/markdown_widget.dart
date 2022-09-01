/*
 * Filename: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/widgets/markdown_widget.dart
 * Path: /Users/g0rdan/Projects/g0rdan.github.io/gordindev/lib/widgets
 * Created Date: Sunday, August 28th 2022, 5:04:10 pm
 * Author: Denis Gordin
 * 
 * Copyright (c) 2022 Denis Gordin
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

const padding = 16.0;

class MarkdownWidget extends StatefulWidget {
  final String mdPath;

  const MarkdownWidget({required this.mdPath, Key? key}) : super(key: key);

  @override
  State<MarkdownWidget> createState() => _MarkdownWidgetState();
}

class _MarkdownWidgetState extends State<MarkdownWidget>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    value: 0.0,
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(milliseconds: 300),
        () => _controller.animateTo(1.0),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString(widget.mdPath),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _controller.value,
                child: Markdown(
                  padding: EdgeInsets.fromLTRB(
                    _controller.value * padding,
                    padding,
                    padding * 2 - _controller.value * padding,
                    padding,
                  ),
                  selectable: true,
                  data: snapshot.data!,
                  onTapLink: (String text, String? href, String title) {
                    if (href != null) {
                      launchLink(
                        href,
                        isNewTab: true,
                      );
                    }
                  },
                ),
              );
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
