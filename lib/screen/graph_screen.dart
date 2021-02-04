import 'package:flutter/material.dart';
import 'package:graph_chart_flutter/widgets/graph_header.dart';
import 'package:graph_chart_flutter/widgets/new_transaction.dart';
import 'package:graph_chart_flutter/widgets/transaction_card.dart';

class GraphScreen extends StatefulWidget {
  static const Map<int, Color> colorMap = {
    50: Color.fromRGBO(42, 54, 59, 0.1),
    100: Color.fromRGBO(42, 54, 59, 0.2),
    200: Color.fromRGBO(42, 54, 59, 0.3),
    300: Color.fromRGBO(42, 54, 59, 0.4),
    400: Color.fromRGBO(42, 54, 59, 0.5),
    500: Color.fromRGBO(42, 54, 59, 0.6),
    600: Color.fromRGBO(42, 54, 59, 0.7),
    700: Color.fromRGBO(42, 54, 59, 0.8),
    800: Color.fromRGBO(42, 54, 59, 0.9),
    900: Color.fromRGBO(42, 54, 59, 1.0),
  };

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = 0.55;
    double _opacity = 0.9;

    void _addTransaction() {
      setState(() {
        _height = 0.08;
        _opacity = 1;
      });
    }

    void _done() {
      setState(() {
        _height = 0.55;
        _opacity = 0.9;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text('グラフ'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.short_text),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.person_outline), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              GraphHeader(_addTransaction),
              NewTransaction(
                opacity: _opacity,
                done: _done,
              ),
            ],
          ),
          TransactionCard(
            height: _height,
          ),
        ],
      ),
    );
  }
}
