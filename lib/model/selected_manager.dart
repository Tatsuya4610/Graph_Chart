import 'package:flutter/cupertino.dart';

class SelectedManager extends ChangeNotifier {



  int _selectedIndex = 0;

  LabeledGlobalKey _homeKey = LabeledGlobalKey('homeKey');
  LabeledGlobalKey _profileKey = LabeledGlobalKey('myProfileKey');
  LabeledGlobalKey _cartKey = LabeledGlobalKey('cartKey');
  LabeledGlobalKey _setKey = LabeledGlobalKey('setKey');

  LabeledGlobalKey get homeKey => _homeKey;
  LabeledGlobalKey get profileKey => _profileKey;
  LabeledGlobalKey get cartKey => _cartKey;
  LabeledGlobalKey get setKey => _setKey;

  RenderBox renderBox;
  double _startYPosition;


  int get selectedIndex => _selectedIndex;
  double get startYPosition => _startYPosition;




  set selectedIndex(int value) {
    _selectedIndex = value;

    switch (_selectedIndex) {
      case 0: //selectedIndex0の場合。
        renderBox = _homeKey.currentContext.findRenderObject();
        break;
      case 1:
        renderBox = _profileKey.currentContext.findRenderObject();
        break;
      case 2:
        renderBox = _cartKey.currentContext.findRenderObject();
        break;
      case 3:
        renderBox = _setKey.currentContext.findRenderObject();
        break;
    }
    //各々の選択した時のY軸(縦)始まり地点を求める。
    _startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    print(_startYPosition);

    notifyListeners();
  }

  void firstLayout() {
    renderBox = _homeKey.currentContext.findRenderObject();
    _startYPosition = renderBox.localToGlobal(Offset.zero).dy;
  }

}


