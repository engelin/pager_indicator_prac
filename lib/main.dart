import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/provider/page_status.dart';
import 'package:pager_indicator_prac/provider/sub_page_status.dart';
import 'package:pager_indicator_prac/ui/root.dart';
import 'package:pager_indicator_prac/ui/root_with_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pager Indicator Practice',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CurrentPage>(
            create: (context) => CurrentPage(),
          ),
          ChangeNotifierProvider<SubPageStatus>(
            create: (context) => SubPageStatus(),
          ),
        ],
        child: RootPage(),
      ),
      // ChangeNotifierProvider<CurrentPage>(
      //   create: (context) => CurrentPage(),
      //   child: RootPage(),
      // ),
    );
  }
}
