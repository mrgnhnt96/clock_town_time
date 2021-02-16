import 'package:flutter/material.dart';

class MinuteCircle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        alignment: Alignment.center,
        turns: AlwaysStoppedAnimation(minute / 60),
        child: Container(
          margin: const EdgeInsets.all(32),
          height: _screenSize.width * .6,
          width: _screenSize.width * .6,
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
