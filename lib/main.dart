import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:graph_chart_flutter/screen/graph_screen.dart';
import 'package:graph_chart_flutter/screen/chart_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GraphScreen(),
      routes: {
        ChartScreen.id : (context) => ChartScreen(),
      },
    );
  }
}

