import 'package:bytebank_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  final Transaction _transaction;

  TransactionItemWidget(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(
          _transaction.value.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          _transaction.contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
