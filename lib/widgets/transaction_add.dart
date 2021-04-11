import 'package:flutter/material.dart';

class TransactionAdd extends StatelessWidget {
  final Function addHandler;
  final itemController = TextEditingController();
  final amountController = TextEditingController();

  TransactionAdd(this.addHandler);

  @override
  Widget build(BuildContext context) {
    void submitData() {
      final enterdItem = itemController.text;
      final enterdAmount = double.parse(amountController.text);

      if (enterdItem.isEmpty || enterdAmount <= 0) {
        print("error");
        return;
      }

      addHandler(enterdItem, enterdAmount);
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: itemController,
              onSubmitted: (_) => submitData(),
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
          ),
          FlatButton(
            onPressed: () => submitData(),
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
