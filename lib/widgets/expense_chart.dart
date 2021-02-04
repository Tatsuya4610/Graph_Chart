import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExpenseChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const ExpenseChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      seriesList,
      animate: animate, //trueでアニメーション付き。
      animationDuration: Duration(seconds: 1),
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 15, //円グラフの太さ
        strokeWidthPx: 0, //グラフの間隔。
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
            labelPadding: 0, //円グラフ横に記載する文字のPadding
            showLeaderLines: false, //trueで矢印付きマーク。
            outsideLabelStyleSpec: charts.TextStyleSpec(
              fontSize: 12, //円グラフ横記載の文字サイズ。
              color: charts.MaterialPalette.white,
            ),
          )
        ],
      ),
      behaviors: [
        charts.DatumLegend(
          position: charts.BehaviorPosition.start, //内訳をグラフ左表示。startで内訳右。
          outsideJustification:
              charts.OutsideJustification.start, //内訳の位置。startで上部。
          horizontalFirst: false,
          desiredMaxColumns: 5,
          cellPadding: EdgeInsets.only(
            //内訳のリストPadding
            right: 5,
            bottom: 10,
          ),
          entryTextStyle: charts.TextStyleSpec(
            fontSize: 12, //内訳リストの文字サイズ。
            color: charts.MaterialPalette.white,
          ),
        )
      ],
    );
  }
}
