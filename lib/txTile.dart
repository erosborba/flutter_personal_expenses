import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TxCard extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime timestamp;

  TxCard({this.id, this.title, this.amount, this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              height: 60,
              width: 120,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.purple)),
              child: Center(
                child: Text(
                  'R\$ $amount',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[850],
                      fontWeight: FontWeight.bold),
                ),
                Text(DateFormat('EEE, d MMM').format(timestamp),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
