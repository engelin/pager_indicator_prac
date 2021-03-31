import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/ui/graph/graph.dart';
import 'package:pager_indicator_prac/ui/muscles/muscles.dart';
import 'package:pager_indicator_prac/ui/muscles/muscles_with_provider.dart';
import 'package:pager_indicator_prac/widgets/custom_tab_pages_widget.dart';

class RootPage extends StatelessWidget {
  List<String> _pageNames = ['Muscles', 'Graph'];

  List<Widget> _pages = [
    MusclesPage(),
    GraphPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
