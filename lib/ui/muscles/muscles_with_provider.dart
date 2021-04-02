import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/provider/sub_page_status.dart';
import 'package:pager_indicator_prac/ui/muscles/daily_muscles.dart';
import 'package:pager_indicator_prac/ui/muscles/monthly_muscles.dart';
import 'package:provider/provider.dart';

class MusclesPageWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _up = true;
    SubPageStatus _status = Provider.of<SubPageStatus>(context);

    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 300),
                reverse: !_up,
                // Consumer<SubPageStatus>(
                //   builder: (_, snapshot, child) {
                //     return !snapshot.getCurrPage();
                //   },
                // ),
                transitionBuilder: (Widget child, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.vertical,
                  );
                },
                child: (true == _up) ? DailyMusclesPage() : MonthlyMusclesPage(),
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
          int sensitivity = 5;
          if (details.delta.dy > sensitivity) {
            if (false == _up) {
              _up = true;
              print("down");
              _status.setCurrPage(false);
            }
          } else if (details.delta.dy < -sensitivity) {
            if (true == _up) {
              _up = false;
              print("up");
              _status.setCurrPage(true);
            }
          }
        },
      ),
    );
  }
}
