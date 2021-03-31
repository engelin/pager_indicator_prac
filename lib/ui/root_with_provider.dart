import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/provider/page_status.dart';
import 'package:pager_indicator_prac/ui/graph/graph.dart';
import 'package:pager_indicator_prac/ui/muscles/muscles.dart';
import 'package:pager_indicator_prac/widgets/custom_tab_pages_widget.dart';
import 'package:provider/provider.dart';

class RootPageWithProvdier extends StatelessWidget {
  PageController _pageController = PageController(initialPage: 0);

  final List<String> _pageNames = [
    'Muscles',
    'Graph'
  ];

  final List<Widget> _pages = [
    MusclesPage(),
    GraphPage(),
  ];

  // 현재 페이지 포지션을 나타낼 변수
  double currPagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: _pages,
          ),
          Positioned(
            left: 25,
            top: 150,
            child: Text(currPagePosition.toString()),
          ),
          Consumer<CurrentPage>(builder: (ctx, currentPage, widget) {
            currentPage.setCurrPage(currPagePosition);
            return Positioned(
              left: 25,
              top: 150,
              child: Text(currentPage.getCurrPage().toString()),
            );
          }),
          CustomTabPagesWidget(
            pages: _pages,
            pageNum: _pages.length,
            pageNames: _pageNames,
          ),
        ],
      ),
    );
  }
}
