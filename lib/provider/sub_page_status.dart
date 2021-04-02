import 'package:flutter/cupertino.dart';

class SubPageStatus extends ChangeNotifier {
  bool _currPage = false;

  bool getCurrPage() => _currPage;

  void setCurrPage(bool up) {
    // up == true , _currPage == false(daily) ==> _currPage = true
    // up == false , _currPage == true(weekly) ==> _currPage = false
    if (true == up && false == _currPage) {
      _currPage = true;
    } else if (false == up && true == _currPage) {
      _currPage = false;
    } else {
      print("SubPageStatus - setCurrPage : skip");
    }
    notifyListeners();
  }
}
