import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionAdd extends StatefulWidget {
  final Function addHandler;

  TransactionAdd(this.addHandler);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  final _itemController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      final enterdItem = _itemController.text;
      final enterdAmount = double.parse(_amountController.text);

      if (enterdItem.isEmpty || enterdAmount <= 0 || _selectedDate == null) {
        print("error");
        return;
      }

      widget.addHandler(enterdItem, enterdAmount, _selectedDate);
      Navigator.of(context).pop();
    }

    void _presentDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime.now())
          .then((_pickedDate) {
        if (_pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = _pickedDate;
        });
      });
    }

    return SingleChildScrollView(
      child: Container(
        height: 350,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _itemController,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            Container(
              height: 70,
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    _selectedDate == null
                        ? Text('No date chosen!')
                        : Text(DateFormat.yMd().format(_selectedDate)),
                    TextButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          'Choose date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => _submitData(),
              child: Text('Add transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            ),
          ],
        ),
      ),
    );
  }
}
