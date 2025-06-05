import 'package:flutter/material.dart';

class CatSwipeAnimation extends StatefulWidget {
  final Widget child;
  final Function(bool isLike) onSwipe;

  const CatSwipeAnimation({
    super.key,
    required this.child,
    required this.onSwipe,
  });

  @override
  State<CatSwipeAnimation> createState() => _CatSwipeAnimationState();
}

class _CatSwipeAnimationState extends State<CatSwipeAnimation> {
  Offset _position = Offset.zero;
  double _angle = 0;
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _position += details.delta;
          _angle = _position.dx * 0.01;
          _opacity = 1.0 - (_position.dx.abs() / 500).clamp(0.0, 0.5);
        });
      },
      onPanEnd: (details) {
        if (_position.dx.abs() > 100) {
          widget.onSwipe(_position.dx > 0);
          _resetPosition();
        } else {
          _resetPosition();
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _opacity,
        child: Transform.translate(
          offset: _position,
          child: Transform.rotate(
            angle: _angle,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _resetPosition() {
    setState(() {
      _position = Offset.zero;
      _angle = 0;
      _opacity = 1.0;
    });
  }
}