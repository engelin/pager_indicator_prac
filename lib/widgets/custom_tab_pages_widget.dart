import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/constants.dart';
import 'package:pager_indicator_prac/widgets/model/custom_tab_model.dart';

class CustomTabPagesWidget extends StatefulWidget {
  CustomTabPagesWidget({
    @required this.pages,
    @required this.pageNum,
    @required this.pageNames,
  })
      : this.titleStyle = TextStyle(fontSize: 30.0, color: Colors.black45),
        this.activeTitleStyle = TextStyle(fontSize: 30.0, color: Colors.black) {
    assert(pages.length == pageNum);
    assert(pages.length == pageNames.length);
  }

  // Pages
  final List<Widget> pages;

  // Number of Pages
  final int pageNum;

  // Each name of pages
  final List<String> pageNames;

  // text title style
  final TextStyle titleStyle;
  final TextStyle activeTitleStyle;

  @override
  _CustomTabPagesWidgetState createState() => _CustomTabPagesWidgetState();
}

class _CustomTabPagesWidgetState extends State<CustomTabPagesWidget> {
  //
  // PageController for CMBTabBar
  //
  PageController _pageController = PageController(initialPage: 0);

  //
  // Current page's indicator variable
  //
  double currPagePosition = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        // Page position for Current page's indicator
        // 0.0 ~ (N-1).0
        currPagePosition = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: widget.pages,
          ),
          Positioned(
            left: MUSCLES_PAGE_TAB_OFFSET,
            child: _buildTabTitle(),
          ),
          _buildTabUnderLine(currPagePosition, widget.pageNum),
        ],
      ),
    );
  }

  ///
  /// Calculate each title's size
  ///
  List<Size> _calTitleSize(List<String> titles, TextStyle style) {
    if(titles.length == 0 || null == style) {
      assert(null != "Input parameters are invalid");
    }

    List<Size> sizes = [];

    for (int i = 0; i < titles.length; i++) {
      final TextPainter textPainter = TextPainter(
          text: TextSpan(text: titles[i], style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr)
        ..layout(minWidth: 0, maxWidth: double.infinity);

      sizes.add(textPainter.size);
    }

    if (0 == sizes.length) {
      assert(0 != sizes.length);
    }

    return sizes;
  }

  ///
  /// Drawing Tab titles
  ///
  Widget _buildTabTitle() {
    List<Widget> titles = [];

    for (int i = 0; i < widget.pageNum; i++) {
      titles.add(TextButton(
        style: TextButton.styleFrom(primary: Colors.white),
        child: Text(
          widget.pageNames[i],
          style: (currPagePosition.round() == i)
              ? widget.activeTitleStyle
              : widget.titleStyle,
        ),
        onPressed: () {
          _pageController.animateToPage(i,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
      ));
    }

    if (0 == titles.length) {
      assert(0 != titles.length);
    }

    return Row(
      children: titles,
    );
  }

  Widget _buildTabUnderLine(double pos, int num) {
    List<Size> sizes = _calTitleSize(widget.pageNames, widget.titleStyle);

    return CustomPaint(
        painter: CustomTabUnderLine(position: pos, number: num, sizes: sizes));
  }
}

class CustomTabUnderLine extends CustomPainter {
  final double position;
  final int number;
  final List<Size> sizes;

  List<Offset> _offesets = [];

  CustomTabUnderLine({this.position, this.number, this.sizes}) {
    assert(0 != sizes.length);
    int ret = _initOffsets();
    if (0 != ret) {
      assert(0 == ret);
    }
  }

  int _initOffsets() {
    double prevOffsetX = MUSCLES_PAGE_TAB_LINE_OFFSET;
    double prevWidth = 0.0;

    for (int i = 0; i < number; i++) {
      double currOffsetX = 0.0;
      double currOffsetY = 0.0;
      assert(0 != sizes[i].width);
      double currWidth = sizes[i].width;

      currOffsetX = prevOffsetX +
          prevWidth / 2 +
          currWidth / 2 +
          i * MUSCLES_PAGE_TAB_LINE_SPACE_X;
      currOffsetY = sizes[i].height + MUSCLES_PAGE_TAB_LINE_SPACE_Y;

      _offesets.add(Offset(currOffsetX, currOffsetY));

      prevOffsetX = currOffsetX;
      prevWidth = currWidth;
    }

    if (0 == _offesets.length) {
      assert(0 != _offesets.length);
      return -1;
    }

    return 0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < number; i++) {
      //
      // tab underline draw
      //
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: _offesets[i],
                  width: sizes[i].width,
                  height: MUSCLES_PAGE_TAB_LINE_HEIGHT),
              Radius.circular(15)),
          Paint()
            ..color = Colors.black.withOpacity(0.5)
            ..style = PaintingStyle.fill);
    }

    //
    // current tab underline draw
    //
    int floorPos = position.floor(); // 내림
    int ceilPos = position.ceil();
    int roundPos = position.round(); // 반올림

    double currWidth = sizes[floorPos].width;
    double cursorX = 0.0;
    double cursorY = sizes[roundPos].height + MUSCLES_PAGE_TAB_LINE_SPACE_Y;

    if (0 != (position - floorPos)) {
      currWidth = (1 - (position - roundPos).abs()) * sizes[roundPos].width;
      cursorX = _offesets[floorPos].dx +
          (_offesets[ceilPos].dx - _offesets[floorPos].dx) *
              (position - floorPos);
    } else {
      cursorX = _offesets[roundPos].dx;
    }

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(cursorX, cursorY),
                width: (cos(position.abs() * pi)) * currWidth,
                height: MUSCLES_PAGE_TAB_LINE_HEIGHT),
            Radius.circular(15)),
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
