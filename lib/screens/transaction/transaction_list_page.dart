import 'package:bytebank_app/models/transaction.dart';
import 'package:bytebank_app/network/webclients/transaction_webclient.dart';
import 'package:bytebank_app/widgets/loading_progress_centered_widget.dart';
import 'package:bytebank_app/widgets/transaction_item_widget.dart';
import 'package:flutter/material.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  final TransactionWebClient _transactionWebClient = TransactionWebClient();
  static const title = "Transactions";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Transaction>>(
          future: _transactionWebClient.findAll(),
          builder: (context, snapshot) {
            List<Transaction>? transactionList = snapshot.data;
            if (transactionList != null) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return LoadingProgressCenteredWidget();

                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: transactionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TransactionItemWidget(
                        transaction: transactionList[index],
                      );
                    },
                  );
              }
            }
            return Container(
              child: Center(child: Text('No transactions found.')),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //   navigateToTransactionFormPage(context);
        },
      ),
    );
  }

  // Future<dynamic> navigateToTransactionFormPage(BuildContext context) async {
  //   final result =
  //       await Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return TransactionFormPage();
  //   }));
  // }
}
