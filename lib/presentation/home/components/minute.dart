import 'package:flutter/material.dart';

class MinuteCircle extends StatefulWidget {
  const MinuteCircle({
    Key key,
    @required Size screenSize,
    @required this.minute,
  })  : _screenSize = screenSize,
        assert(minute != null),
        super(key: key);

  final Size _screenSize;
  final int minute;

  @override
  _MinuteCircleState createState() => _MinuteCircleState();
}

class _MinuteCircleState extends State<MinuteCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  int _min;
  int _previousMin;

  @override
  void initState() {
    super.initState();
    _min = widget.minute;
    _previousMin = widget.minute;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_min != widget.minute) {
      _previousMin = _min;
      _controller.reset();
      _min = widget.minute;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        alignment: Alignment.center,
        turns: _animation
            .drive(Tween<double>(begin: (_previousMin / 60), end: (_min / 60))),
        child: Container(
          margin: const EdgeInsets.all(32),
          height: widget._screenSize.width * .6,
          width: widget._screenSize.width * .6,
          decoration: BoxDecoration(
            color: Colors.brown,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.topCenter,
          child: Container(
            width: 3,
            height: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
