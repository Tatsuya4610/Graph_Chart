import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
// import 'package:graph_chart_flutter/model/selected_manager.dart';
import 'package:graph_chart_flutter/clipper/sidebar_clipper.dart';
import 'package:graph_chart_flutter/widgets/sidebar_item.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with AfterLayoutMixin { //AfterLayoutMixinはStatefulWidget必須。
  int selectedIndex = 0;
  LabeledGlobalKey _homeKey = LabeledGlobalKey('homeKey');
  LabeledGlobalKey _profileKey = LabeledGlobalKey('myProfileKey');
  LabeledGlobalKey _cartKey = LabeledGlobalKey('cartKey');
  LabeledGlobalKey _setKey = LabeledGlobalKey('setKey');

  RenderBox renderBox;
  double startYPosition;

  void onTabTap(int index) {
    setState(() {
      selectedIndex = index;
      switch (selectedIndex) {
        case 0:
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
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
      // print(startYPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          width: 90,
          top: 0,
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: SidebarClipper(
              (startYPosition == null) ?  0 : startYPosition - 30, //最初はボタン選択されていない為、nullになる。
              (startYPosition == null) ? 0 :  startYPosition + 70,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blueAccent,
                    Color.fromRGBO(16, 255, 0, 100),
                  ],
                  // stops: [0.05, 0.3, 0.5, 0.55, 0.8, 1],//colors順番で。
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -25,
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SidebarItem(
                      key: _homeKey,
                      text: 'ホーム',
                      onTap: () {
                        onTabTap(0);
                      },
                      isSelected: selectedIndex == 0,
                    ),
                    SidebarItem(
                      key: _profileKey,
                      text: 'プロフィール',
                      onTap: () {
                        onTabTap(1);
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    SidebarItem(
                      key: _cartKey,
                      text: 'カート',
                      onTap: () {
                        onTabTap(2);
                      },
                      isSelected: selectedIndex == 2,
                    ),
                    SidebarItem(
                      key: _setKey,
                      text:  '設定',
                      onTap: () {
                        onTabTap(3);
                      },
                      isSelected: selectedIndex == 3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ],
    );
  }

  //RiverPod使用で情報管理し別クラスから情報を持って来ようとしたがNullになってしまう。
  //AfterLayout自体がStatefulWidget必須なので1つのWidgetで今回は管理。SelectedManagerにRiverPod使用時の状態管理記載。
  @override
  void afterFirstLayout(BuildContext context) { //ビルドした後に最初にレイアウト実行する。
    setState(() {
      //できればSelectedManagerから持ってきたいがNull
      renderBox = _homeKey.currentContext.findRenderObject();
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;

      // SelectedManager().firstLayout();  null。Consumerで実装必要。

    });
  }
}





