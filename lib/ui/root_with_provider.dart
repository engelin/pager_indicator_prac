import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/provider/page_status.dart';
import 'package:pager_indicator_prac/ui/graph/graph.dart';
import 'package:pager_indicator_prac/ui/muscles/muscles.dart';
import 'package:pager_indicator_prac/widgets/custom_tab_pages_widget.dart';
import 'package:provider/provider.dart';

class RootPageWithProvdier extends StatelessWidget {
  final List<String> _pageNames = [
    'Muscles',
    'Graph'
  ];

  final List<Widget> _pages = [
    MusclesPage(),
    GraphPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTabPageView(
        pages: _pages,
        pageNum: _pages.length,
        pageNames: _pageNames,
      ),
    );
  }
}
