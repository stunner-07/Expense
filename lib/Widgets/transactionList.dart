import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: <Widget>[
                Container(
                  height: constrains.maxHeight * 0.1,
                  child: Text(
                    'No Transatcions yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                  height: constrains.maxHeight * 0.1,
                ),
                Container(
                  height: constrains.maxHeight * 0.8,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                  // child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //       margin: EdgeInsets.symmetric(
                  //         vertical: 10,
                  //         horizontal: 15,
                  //       ),
                  //       child: Text(
                  //         '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           color: Theme.of(context).primaryColor,
                  //         ),
                  //       ),
                  //       padding: EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //         color: Theme.of(context).primaryColor,
                  //         width: 2,
                  //       )),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(
                  //           transactions[index].title,
                  //           style: Theme.of(context).textTheme.title,
                  //         ),
                  //         Text(
                  //           DateFormat.yMMMd().format(transactions[index].date),
                  //           style: TextStyle(color: Colors.grey),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ),
                  //second alternative
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                            icon: Icon(
                              Icons.delete,
                            ),
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete,
                            ),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                          ),
                  ));
            },
          );
  }
}
