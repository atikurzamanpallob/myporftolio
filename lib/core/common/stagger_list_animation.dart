// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class StaggerListAnimation extends StatefulWidget {
  final int index;
  final Widget item;
  final bool isVertical;
  final int duration;
  const StaggerListAnimation({
    super.key,
    required this.index,
    required this.item,
    this.duration = 1000,
    this.isVertical = false,
  });

  @override
  _StaggerListAnimationState createState() => _StaggerListAnimationState();
}

class _StaggerListAnimationState extends State<StaggerListAnimation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // LEFT for even, RIGHT for odd
    final beginOffset = widget.index.isEven
        ? widget.isVertical
              ? Offset(0, -1)
              : Offset(-1, 0) // from Left
        : widget.isVertical
        ? Offset(0, 1)
        : Offset(1, 0); // from Right

    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: beginOffset, end: Offset.zero),
      duration: Duration(milliseconds: widget.duration),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: value * 1500, // smooth slide
          child: Opacity(
            opacity: 1 - value.distance, // fade while sliding
            child: child,
          ),
        );
      },
      child: widget.item,
    );
  }
}
