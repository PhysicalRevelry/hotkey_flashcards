import 'package:flutter/material.dart';

class GrowingIcon extends StatefulWidget {
  const GrowingIcon({Key? key, required this.icon, required this.color}) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  _GrowingIconState createState() => _GrowingIconState();
}

class _GrowingIconState extends State<GrowingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1),);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScaleTransition(
        scale: _animation,
        child: Icon(
          widget.icon,
          color: widget.color,
          size: 100,
        ),
      ),
    );
  }
}

