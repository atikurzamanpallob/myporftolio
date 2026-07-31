import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  const TypewriterText({
    super.key,
    required this.segments,
    this.speed = const Duration(milliseconds: 70),
  });

  final List<TypewriterSegment> segments;
  final Duration speed;

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int currentSegment = 0;
  int currentChar = 0;

  @override
  void initState() {
    super.initState();
    startTyping();
  }

  Future<void> startTyping() async {
    while (currentSegment < widget.segments.length) {
      await Future.delayed(widget.speed);

      setState(() {
        currentChar++;

        if (currentChar > widget.segments[currentSegment].text.length) {
          currentSegment++;
          currentChar = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];

    for (int i = 0; i < widget.segments.length; i++) {
      final segment = widget.segments[i];

      if (i < currentSegment) {
        spans.add(TextSpan(text: segment.text, style: segment.style));
      } else if (i == currentSegment) {
        spans.add(
          TextSpan(
            text: segment.text.substring(0, currentChar),
            style: segment.style,
          ),
        );
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: .end,
      children: [Flexible(child: Text.rich(TextSpan(children: spans)))],
    );
  }
}

class TypewriterSegment {
  const TypewriterSegment({required this.text, required this.style});

  final String text;
  final TextStyle style;
}
