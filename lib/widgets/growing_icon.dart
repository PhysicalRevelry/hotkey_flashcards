import 'package:flutter/material.dart';

class GrowingIcon extends StatefulWidget {
  const GrowingIcon({Key key, this.icon, this.color}) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  _GrowingIconState createState() => _GrowingIconState();
}

class _GrowingIconState extends State<GrowingIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

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
        // alignment: Alignment.center,
        child: Icon(
          widget.icon,
          color: widget.color,
          size: 100,
        ),
      ),
    );
  }
}

// class GrowingIcon extends StatelessWidget {
//   const GrowingIcon({
//     Key key,
//     @required this.ticker,
//     @required double size,
//   }) : _size = size, super(key: key);
//
//   final TickerProvider ticker;
//   final double _size;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSize(
//       curve: Curves.bounceIn,
//       duration: Duration(seconds: 5),
//       vsync: ticker,
//       child: Icon(
//         Icons.check,
//         color: Colors.green,
//         size: _size,
//       ),
//     );
//   }
// }
