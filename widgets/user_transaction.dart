import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  // transaction list
  final List<Transaction> _userTransactions = [
    // create a default tx
    Transaction(
      amount: 25.5,
      date: DateTime.now(),
      id: '1',
      title: 'Milk',
    ),
    Transaction(
      amount: 80.60,
      date: DateTime.now(),
      id: '2',
      title: 'Eggs',
    ),
  ];

  // method to add new tx
  void _addNewTx(String title, double amount) {
    final tx = Transaction(
      amount: amount,
      title: title,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // just pass a location pointer to the new transaction so they can send the data
        NewTransaction(_addNewTx),
        TransactionList(_userTransactions),
      ],
    );
  }
}
