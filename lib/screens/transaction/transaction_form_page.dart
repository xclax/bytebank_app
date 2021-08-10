import 'package:bytebank_app/widgets/editor_text_form.dart';
import 'package:flutter/material.dart';

class TransactionFormPage extends StatefulWidget {
  const TransactionFormPage({Key? key}) : super(key: key);

  @override
  _TransactionFormPageState createState() => _TransactionFormPageState();
}

class _TransactionFormPageState extends State<TransactionFormPage> {
  TextEditingController _textEditingControllerAccountNumber =
      TextEditingController();
  TextEditingController _textEditingControllerValue = TextEditingController();
  static const title = 'New Transaction';
  static const hintTextAccount = '0000';
  static const hintTextValue = '100.00';
  static const labelTextAccount = 'Account Number';
  static const labelTextValue = 'Value';
  static const buttonTextConfirm = 'Confirm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                textEditingController: _textEditingControllerAccountNumber,
                hintText: hintTextAccount,
                labelText: labelTextAccount,
              ),
              Editor(
                textEditingController: _textEditingControllerValue,
                hintText: hintTextValue,
                labelText: labelTextValue,
              ),
              ElevatedButton(
                  onPressed: () {
                    // createTransaction(context);
                  },
                  child: Text(buttonTextConfirm))
            ],
          ),
        ));
  }

  // void createTransaction(BuildContext context) {
  //   final Contact? contact =
  //       int.tryParse(_textEditingControllerAccountNumber.text);
  //   final double? valor = double.tryParse(_textEditingControllerValue.text);
  //
  //   final transaction = Transaction(valor!, contact!);
  //   Navigator.pop(context, transaction);
  // }
}
