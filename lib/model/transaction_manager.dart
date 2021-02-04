import 'package:flutter/material.dart';
import 'package:graph_chart_flutter/model/transaction.dart';

class TransactionManager extends ChangeNotifier {
  List<Transaction> _transaction = [
    Transaction(
      id: 1,
      title: '朝食',
      value: 100,
      category: 'Meals',
      iconData: Icons.fastfood,
      color: Colors.pinkAccent,
    ),
    Transaction(
      id: 2,
      title: '読書',
      value: 200,
      category: 'Private',
      iconData: Icons.casino,
      color: Colors.red,
    ),
    Transaction(
      id: 3,
      title: 'ゲーム',
      value: 300,
      category: 'Private',
      iconData: Icons.gamepad,
      color: Colors.yellowAccent,
    ),
    Transaction(
      id: 4,
      title: '日用品',
      value: 400,
      category: 'Daily',
      iconData: Icons.home,
      color: Colors.greenAccent,
    ),
    Transaction(
      id: 5,
      title: '夕食',
      value: 500,
      category: 'Meals',
      iconData: Icons.dinner_dining,
      color: Colors.blue,
    ),
    Transaction(
      id: 6,
      title: 'ネットショッピング',
      value: 600,
      category: 'Daily',
      iconData: Icons.home,
      color: Colors.orangeAccent,
    ),
  ];
  List<Transaction> get transaction {
    return _transaction;
  }
}
