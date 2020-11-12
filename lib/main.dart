import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses/txTile.dart';

import 'transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              elevation: 8,
              child: Text('Teste'),
            ),
          ),
          Column(
            children: transactions
                .map((tx) => TxCard(
                      id: tx.id,
                      title: tx.title,
                      amount: tx.amount,
                      timestamp: tx.timestamp,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
