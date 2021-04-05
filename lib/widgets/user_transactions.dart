import 'package:flutter/material.dart';
import './transaction_add.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', item: 'Schoenen', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', item: 'Boodschappen', amount: 9.56, date: DateTime.now()),
    Transaction(
        id: 't3', item: 'Computer', amount: 1000.00, date: DateTime.now()),
  ];
  void _addTransaction(String txItem, double txAmount) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        item: txItem,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionAdd(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
