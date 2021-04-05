import 'package:flutter/material.dart';

class TransactionAdd extends StatelessWidget {
  final Function addHandler;
  final itemController = TextEditingController();
  final amountController = TextEditingController();
  TransactionAdd(this.addHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: itemController,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
          ),
          FlatButton(
            onPressed: () {
              addHandler(
                  itemController.text, double.parse(amountController.text));
            },
            child: Text(
              'Add transaction',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
