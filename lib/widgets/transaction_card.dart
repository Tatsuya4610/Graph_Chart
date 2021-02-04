import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:graph_chart_flutter/model/transaction_manager.dart';
import 'package:graph_chart_flutter/widgets/transaction_item.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; //DateFormat日本語化使用。
import 'package:graph_chart_flutter/screen/chart_screen.dart';

final transactionProvider =
    ChangeNotifierProvider((ref) => TransactionManager());

class TransactionCard extends StatefulWidget {
  final double height;

  const TransactionCard({this.height});

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  int _date = 16;
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');
    final mediaQuery = MediaQuery.of(context);
    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * 0.03,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.decelerate,
        width: mediaQuery.size.width * 0.94,
        height: mediaQuery.size.height * widget.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Consumer(
          builder: (context, watch, child) {
            final transaction = watch(transactionProvider).transaction;
            return Column(
              children: <Widget>[
                Container(
                  height: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed(ChartScreen.id);
                        },
                        child: Text(
                          '一覧',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: Icon(Icons.arrow_left),
                              onTap: () {
                                setState(() {
                                  _date--;
                                });
                              },
                            ),
                            Text(
                              '${DateFormat.yM('ja').format(DateTime.now())}/$_date',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              child: Icon(Icons.arrow_right),
                              onTap: () {
                                setState(() {
                                  _date++;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: transaction.length,
                    itemBuilder: (ctx, i) {
                      return TransactionItem(
                        transaction: transaction[i],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
