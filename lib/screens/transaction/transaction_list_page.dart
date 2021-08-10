import 'package:bytebank_app/models/transaction.dart';
import 'package:bytebank_app/screens/transaction/transaction_form_page.dart';
import 'package:bytebank_app/widgets/transaction_item_widget.dart';
import 'package:flutter/material.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  List<Transaction> _transactionList = [];
  static const title = "Transactions";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _transactionList.length,
        itemBuilder: (BuildContext context, int index) {
          return TransactionItemWidget(_transactionList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigateToTransactionFormPage(context);
        },
      ),
    );
  }

  Future<dynamic> navigateToTransactionFormPage(BuildContext context) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TransactionFormPage();
    }));
    setState(() {
      _transactionList.add(result);
    });
  }
}
