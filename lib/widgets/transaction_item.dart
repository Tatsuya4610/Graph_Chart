import 'package:flutter/material.dart';
import 'package:graph_chart_flutter/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: transaction.color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Icon(
            transaction.iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          transaction.category,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: Text(
          '¥${transaction.value}',style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w800,
        ),
        ),
      ),
    );
  }
}
