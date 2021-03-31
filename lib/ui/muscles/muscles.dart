import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/ui/muscles/daily_muscles.dart';
import 'package:pager_indicator_prac/ui/muscles/monthly_muscles.dart';

class MusclesPage extends StatefulWidget {
  @override
  _MusclesPageState createState() => _MusclesPageState();
}

class _MusclesPageState extends State<MusclesPage> {
  bool _onDaily = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 300),
                reverse: !_onDaily,
                transitionBuilder: (Widget child, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.vertical,
                  );
                },
                child: _onDaily ? DailyMusclesPage() : MonthlyMusclesPage(),
              ),
            ),
            Positioned(
              top: 250,
              right: 0,
              child: SizedBox(
                height: 400,
                child: Image(
                  image: AssetImage('assets/images/asdf.png'),
                ),
              ),
            ),
          ],
        ),
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy > sensitivity) {
            if (_onDaily == false) {
              _onDaily = true;
              print("down");

              setState(() {
                ChangePage(_onDaily);
              });
            }
          } else if (details.delta.dy < -sensitivity) {
            if (_onDaily == true) {
              _onDaily = false;
              print("up");

              setState(() {
                ChangePage(_onDaily);
              });
            }
          }
        },
      ),
    );
  }
}

class ChangePage extends StatelessWidget {
  int index = 0;
  List<Widget> test = [DailyMusclesPage(), MonthlyMusclesPage()];

  ChangePage(bool daily) {
    if (daily == 0)
      index = 1;
    else
      index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return test[index];
  }
}
