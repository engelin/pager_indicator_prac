import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/constants.dart';
import 'package:pager_indicator_prac/ui/graph/graph.dart';
import 'package:pager_indicator_prac/ui/muscles/muscles.dart';
import 'package:pager_indicator_prac/widgets/cust_tabbar/custom_tabbar.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  PageController _pageController = PageController(initialPage: 0);

  List<String> _pageNames = [
    'Muscles',
    'Graph'
  ];

  List<Widget> _pages = [
    MusclesPage(),
    GraphPage(),
  ];

  // 현재 페이지 포지션을 나타낼 변수
  double currPagePosition = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        // controller에서 현재 페이지 정보를 가져옴
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: _pages,
          ),
          // Positioned(
          //   left: 25,
          //   top: 128,
          //   child: Text('data'),
          // ),
          // Positioned(
          //   left: 25,
          //   top: 150,
          //   child: Text(currPagePosition.toString()),
          // ),
          CustomPaint(
            size: Size.fromWidth(100),
            painter: CustomTabBar(_pages.length, currPagePosition, _pageNames),
          ),
        ],
      ),
    );
  }
}
