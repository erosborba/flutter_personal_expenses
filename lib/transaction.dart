import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime timestamp;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.timestamp,
  });
}

final List<Transaction> transactions = [
  Transaction(
    id: 't1',
    title: 'Shoes',
    amount: 259.99,
    timestamp: DateTime.now(),
  ),
  Transaction(
    id: 't1',
    title: 'Mercado',
    amount: 85.50,
    timestamp: DateTime.now(),
  )
];

void addNewTransaction(String txTitle, double txAmount) {
  final newTX = Transaction(
    title: txTitle,
    amount: txAmount,
    timestamp: DateTime.now(),
    id: DateTime.now().toString(),
  );
}
