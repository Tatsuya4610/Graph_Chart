import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:graph_chart_flutter/model/expense.dart';
import 'package:graph_chart_flutter/widgets/expense_chart.dart';

class GraphHeader extends StatelessWidget {

  final Function addTransaction;
  GraphHeader(this.addTransaction);

  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense, String>(
      id: 'Expense', //お好み
      domainFn: (Expense expense, _) => expense.category, //＊1デフォルト
      measureFn: (Expense expense, _) => expense.value, //*1
      labelAccessorFn: (Expense expense, _) => '\¥${expense.value}', //*1
      colorFn: (Expense expense, _) =>
          charts.ColorUtil.fromDartColor(expense.color), //*1
      data: [
        Expense('ビジネス', 2000, Colors.lightBlueAccent),
        Expense('食事', 1200, Colors.redAccent),
        Expense('ギフト', 800, Colors.pinkAccent),
        Expense('ゲーム', 600, Colors.yellowAccent),
        Expense('エンターテイメント', 500, Colors.orangeAccent),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * 0.4,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              child: ExpenseChart(
                _series,
                animate: true,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                OutlineButton(
                  onPressed: addTransaction,
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 125,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.playlist_add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'リスト追加',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '提出',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
