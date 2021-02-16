import 'package:clock_town_time/presentation/home/components/hour.dart';
import 'package:clock_town_time/presentation/home/components/minute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Ticker _ticker;
  int _hour, _min;
  bool _isMorning;
  bool _show;

  @override
  void initState() {
    super.initState();
    _show = false;
    _hour ??= 0;
    _min ??= 0;
    _isMorning ??= true;
    _ticker = createTicker((_) {
      final _date = DateTime.now();
      _hour = _date.hour;
      _min = _date.minute;
      _isMorning = _hour <= 8 || _hour >= 20;
      if (!_isMorning) _hour -= 12;
      _show = true;
      setState(() {});
    })
      ..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: AnimatedSwitcher(
      duration: const Duration(milliseconds: 2500),
      child: _show
          ? Stack(
              children: [
                MinuteCircle(
                  key: Key('MinuteCircle'),
                  screenSize: _screenSize,
                  minute: _min,
                ),
                HourCircle(
                  key: Key('HourCircle'),
                  screenSize: _screenSize,
                  hour: _hour,
                  isMorning: _isMorning,
                ),
              ],
            )
          : Container(),
    ));
  }
}
