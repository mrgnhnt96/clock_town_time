import 'package:clock_town_time/presentation/home/components/sun_moon.dart';
import 'package:flutter/material.dart';

class HourCircle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        alignment: Alignment.center,
        turns: AlwaysStoppedAnimation(hour / 12),
        child: Container(
            margin: const EdgeInsets.all(32),
            height: _screenSize.width * .4,
            width: _screenSize.width * .4,
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
                  screenSize: _screenSize,
                  isMorning: isMorning,
                ),
              ],
            )),
      ),
    );
  }
}
