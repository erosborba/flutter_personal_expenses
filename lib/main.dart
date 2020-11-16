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
      title: 'Despesas',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple,
      ),
      home: MyHomePage(title: 'Despesas Pessoais'),
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
  Function cleanText() {
    final titleInput = '';
    final userInput = null;
    return cleanText;
  }

  @override
  Widget build(BuildContext context) {
    String titleInput;
    double amountInput;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Card(
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
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            onChanged: (text) {
                              amountInput = double.parse(text);
                            },
                            decoration: InputDecoration(labelText: 'Valor'),
                          ),
                          FlatButton(
                            child: Text('Adicionar'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                // addNewTransaction(titleInput, amountInput);
                                transactions.add(
                                  Transaction(
                                    id: DateTime.now().toString(),
                                    title: titleInput,
                                    amount: amountInput,
                                    timestamp: DateTime.now(),
                                  ),
                                );
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
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
            Container(
              height: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return TxCard(
                    id: transactions[index].id,
                    title: transactions[index].title,
                    amount: transactions[index].amount,
                    timestamp: transactions[index].timestamp,
                  );
                },
                itemCount: transactions.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
