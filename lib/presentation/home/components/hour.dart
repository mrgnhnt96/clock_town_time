import 'package:clock_town_time/presentation/home/components/sun_moon.dart';
import 'package:flutter/material.dart';

class HourCircle extends StatefulWidget {
  const HourCircle({
    Key key,
    @required Size screenSize,
    @required this.isMorning,
    @required this.hour,
  })  : _screenSize = screenSize,
        assert(hour != null),
        assert(isMorning != null),
        super(key: key);

  final Size _screenSize;
  final int hour;
  final bool isMorning;

  @override
  _HourCircleState createState() => _HourCircleState();
}

class _HourCircleState extends State<HourCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  int _hour;
  int _previousHour;

  @override
  void initState() {
    super.initState();
    _hour = widget.hour;
    _previousHour = widget.hour;
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
    if (_hour != widget.hour) {
      _previousHour = _hour;
      _controller.reset();
      _hour = widget.hour;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        alignment: Alignment.center,
        turns: _animation.drive(
            Tween<double>(begin: (_previousHour / 12), end: (_hour / 12))),
        child: Container(
            margin: const EdgeInsets.all(32),
            height: widget._screenSize.width * .4,
            width: widget._screenSize.width * .4,
            decoration: BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 3,
                    height: 30,
                    color: Colors.black,
                  ),
                ),
                SunMoonCircle(
                  key: Key('SunMoonCircle'),
                  screenSize: widget._screenSize,
                  isMorning: widget.isMorning,
                ),
              ],
            )),
      ),
    );
  }
}
