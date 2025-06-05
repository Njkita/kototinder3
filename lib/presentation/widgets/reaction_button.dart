import 'package:flutter/material.dart';

class ReactionButton extends StatefulWidget {
  final bool isLike;
  final VoidCallback onPressed;
  final double size;

  const ReactionButton({
    super.key,
    required this.isLike,
    required this.onPressed,
    this.size = 50,
  });

  @override
  State<ReactionButton> createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2)
        .chain(CurveTween(curve: Curves.easeOut))
        .animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    widget.onPressed();
    _controller.forward(from: 0);
    Feedback.forTap(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.0, 0.0),
              radius: 0.8,
              colors: widget.isLike
                  ? [Colors.green.shade100, Colors.green.shade400]
                  : [Colors.red.shade100, Colors.red.shade400],
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.isLike ? Colors.green : Colors.red,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.isLike
                    ? Colors.green.shade200
                    : Colors.red.shade200,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            widget.isLike ? Icons.favorite : Icons.close,
            color: widget.isLike
                ? Colors.green.shade800
                : Colors.red.shade800,
            size: widget.size * 0.6,
          ),
        ),
      ),
    );
  }
}
