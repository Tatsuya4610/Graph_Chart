import 'package:flutter/material.dart';




class SidebarClipper extends CustomClipper<Path> {

  final double startYPosition, endYPosition;

  SidebarClipper(this.startYPosition, this.endYPosition);

  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    //上部曲線。
    path.moveTo(width, 0);
    path.quadraticBezierTo(width / 3, 5, width / 3, 70);
    
    //選択時の曲線。
    path.lineTo(width / 3, startYPosition); //上部始まり位置。
    path.quadraticBezierTo(width / 3, startYPosition + 15, width / 3 - 7, startYPosition + 25); //上部曲線
    path.quadraticBezierTo(0, endYPosition - 47, width / 3 - 10, endYPosition - 25); //中央曲線
    path.quadraticBezierTo(width / 3, endYPosition - 10, width / 3, endYPosition); //下部曲線終了地点。

    //下部曲線
    path.lineTo(width / 3, height - 70);
    path.quadraticBezierTo(width / 3, height - 5, width, height);


    path.lineTo(width, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
  //古いオブジェクトと比較するために新しいオブジェクトを作成するたびに呼び出され、
  // trueを返すとgetClipメソッドが呼び出され、getClipメソッドも呼び出すことができる　　
  // ボックスのサイズが変更されたときにトリガー。
}
