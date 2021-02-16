import 'package:flutter/material.dart';

class SunMoonCircle extends StatelessWidget {
  const SunMoonCircle({
    Key key,
    @required Size screenSize,
    @required this.isMorning,
  })  : _screenSize = screenSize,
        super(key: key);

  final Size _screenSize;
  final bool isMorning;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, .75),
      child: SizedBox(
        height: _screenSize.width * .1,
        width: _screenSize.width * .1,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 1500),
          child: isMorning
              ? Container(
                  key: const Key('night'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                )
              : Container(
                  key: const Key('day'),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
        ),
      ),
    );
  }
}
