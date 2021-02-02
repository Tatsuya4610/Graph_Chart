import 'package:flutter/material.dart';

class ChartClipper extends CustomClipper<Path> {

  final List<double> data;
  final double maxValue;

  ChartClipper({this.data,this.maxValue});

  @override
  Path getClip(Size size) {
    double sectionWidth = size.width / (data.length - 1); //データー数だけ区切り。iが0から始まる為　-1
    Path path = Path();

    path.moveTo(0, size.height); //Container内の占める領域。横幅、高さ一番端端。

    for (int i = 0; i < data.length; i++) {
      path.lineTo(i * sectionWidth, size.height - size.height * (data[i] / maxValue)); //MaxValueを1とした場合のdataの高さ割合。
    }

    path.lineTo(size.width, size.height); //上記ポイントから端まで。(右一番下)



    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}