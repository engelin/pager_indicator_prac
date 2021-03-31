import 'package:flutter/cupertino.dart';

class CurrentPage extends ChangeNotifier {
  int _currPage = 0;

  int getCurrPage() => _currPage;

  void setCurrPage(double pagesStatus) {
    if (pagesStatus == null || pagesStatus < 0) {
      _currPage = 0;
    }
    _currPage = pagesStatus.floor();
  }
}
