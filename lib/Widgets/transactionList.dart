import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions,this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transatcions yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
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
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>deleteTransaction(transactions[index].id),
                      ),
                    ));
              },
            ),
    );
  }
}
