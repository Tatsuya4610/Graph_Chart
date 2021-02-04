import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final int value;
  final String category;
  final IconData iconData;
  final Color color;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.category,
    @required this.iconData,
    @required this.color,
  });
}