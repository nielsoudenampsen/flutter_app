import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delete;
  TransactionList(this.transactions, this.delete);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (ctx, constraint) {
      return transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("Nog geen transacties toegevoegd!",
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraint.maxHeight * 0.4,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      trailing: mediaQuery.size.width > 450
                          ? FlatButton.icon(
                              label: Text('Delete'),
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                delete(transactions[index].id);
                              },
                              textColor: Theme.of(context).errorColor,
                            )
                          : IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                delete(transactions[index].id);
                              },
                              color: Theme.of(context).errorColor,
                            ),
                      title: Text('${transactions[index].item}'),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      leading: CircleAvatar(
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                        radius: 30,
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
