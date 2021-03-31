import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/constants.dart';
import 'package:pager_indicator_prac/widgets/cust_tabbar/model/custom_tab_model.dart';

class CustomTabBar extends CustomPainter {
  final double _currPosition;
  final int _numOfTab;
  final List<String> _tabName;

  CustomTabBar(this._numOfTab, this._currPosition, this._tabName) {
  }

  @override
  void paint(Canvas canvas, Size size) {

    for (int i = 0; i < _numOfTab; i++) {
      // current tab data
      final CustomTabBarModel tab =
          CustomTabBarModel.fromMap(MUSCLES_PAGE_TAB_DATA[i]);

      //
      // tab text draw
      //
      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 25,
      );
      final textSpan = TextSpan(
        text: tab.title,
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )
        ..layout(
          minWidth: 0,
          maxWidth: MUSCLES_PAGE_TAB_TITLE_WIDTH,
        )
        ..paint(
            canvas,
            Offset(
                (MUSCLES_PAGE_TAB_LINE_X_OFFSET +
                    i *
                        (MUSCLES_PAGE_TAB_TITLE_WIDTH +
                            MUSCLES_PAGE_TAB_TITLE_SPACE) -
                    MUSCLES_PAGE_TAB_TITLE_WIDTH / 2),
                MUSCLES_PAGE_TAB_TITLE_Y));

      //
      // tab underline draw
      //
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(
                      MUSCLES_PAGE_TAB_LINE_X_OFFSET +
                          i *
                              (MUSCLES_PAGE_TAB_LINE_WIDTH +
                                  MUSCLES_PAGE_TAB_LINE_SPACE),
                      MUSCLES_PAGE_TAB_LINE_Y),
                  width: MUSCLES_PAGE_TAB_LINE_WIDTH,
                  height: MUSCLES_PAGE_TAB_LINE_HEIGHT),
              Radius.circular(15)),
          Paint()
            ..color = Colors.black.withOpacity(0.5)
            ..style = PaintingStyle.fill);
    }

    //
    // current tab underline draw
    //
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(
                    (MUSCLES_PAGE_TAB_LINE_X_OFFSET +
                        _currPosition *
                            (MUSCLES_PAGE_TAB_LINE_WIDTH +
                                MUSCLES_PAGE_TAB_LINE_SPACE)),
                    MUSCLES_PAGE_TAB_LINE_Y),
                width: MUSCLES_PAGE_TAB_LINE_WIDTH +
                    (-sin(_currPosition.abs() * pi) * 70),
                height: MUSCLES_PAGE_TAB_LINE_HEIGHT),
            Radius.circular(15)),
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
