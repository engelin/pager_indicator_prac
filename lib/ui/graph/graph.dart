import 'package:flutter/material.dart';
import 'package:pager_indicator_prac/ui/graph/inbody_graph.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Text('인바디 변화', style: TextStyle(
              fontSize: 30.0
            ),),
            InbodyGraph(),
          ],
        ),
      ),
    );
  }
}
