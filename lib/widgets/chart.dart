import 'dart:math';
import 'package:flutter/material.dart';
import 'package:graph_chart_flutter/clipper/chart_clipper.dart';

class Chart extends StatelessWidget {
  final List<double> data;

  const Chart({this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: ChartClipper(
          data: data,
          maxValue: data.reduce((max)),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueAccent,
                Color.fromRGBO(16, 255, 0, 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
