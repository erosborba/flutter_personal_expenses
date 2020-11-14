import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    String titleInput;
    double amountInput;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 8,
                child: Text('Teste'),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      onChanged: (text) {
                        titleInput = text;
                      },
                      decoration: InputDecoration(labelText: 'Item'),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        amountInput = double.parse(text);
                      },
                      decoration: InputDecoration(labelText: 'Valor'),
                    ),
                    FlatButton(
                      child: Text('Adicionar'),
                      color: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          // addNewTransaction(titleInput, amountInput);
                          transactions.add(Transaction(
                            id: DateTime.now().toString(),
                            title: titleInput,
                            amount: amountInput,
                            timestamp: DateTime.now(),
                          ));
                        });
                      },
                    ),
                  ],
                ),
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
      ),
    );
  }
}
