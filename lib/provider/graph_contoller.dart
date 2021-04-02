import 'package:flutter/cupertino.dart';

enum GraphMode {
  weight,
  smm, // skeletal muscle mass
  bfm, // body fat mass
}

extension GraphModeHelper on GraphMode{
}

class GraphModeController extends ChangeNotifier {
  GraphMode _mode = GraphMode.weight;

  setMode(GraphMode m) {
    _mode = m;
    notifyListeners();
  }

  GraphMode getMode() {
    return _mode;
  }

}