import 'package:bytebank_app/database/dao/contact_dao.dart';
import 'package:bytebank_app/models/contact.dart';
import 'package:bytebank_app/widgets/editor_text_form.dart';
import 'package:flutter/material.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({Key? key}) : super(key: key);

  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  ContactDao _dao = ContactDao();
  TextEditingController _textEditingControllerName = TextEditingController();
  TextEditingController _textEditingControllerAccountNumber =
      TextEditingController();
  static const labelTextName = 'Name';
  static const labelTextAccountNumber = 'Account Number';
  static const appBarTitle = 'New Contact';
  static const buttonTextConfirm = 'Confirm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        children: [
          Editor(
            textEditingController: _textEditingControllerName,
            labelText: labelTextName,
          ),
          Editor(
            textEditingController: _textEditingControllerAccountNumber,
            labelText: labelTextAccountNumber,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                  onPressed: () {
                    createNewContact(context);
                  },
                  child: Text(buttonTextConfirm)),
            ),
          )
        ],
      ),
    );
  }

  void createNewContact(BuildContext context) {
    String contactName = _textEditingControllerName.text;
    final int? contactAccountNumber =
        int.tryParse(_textEditingControllerAccountNumber.text);

    Contact newContact =
        Contact(name: contactName, accountNumber: contactAccountNumber);
    _dao.save(newContact).then((value) => Navigator.pop(context));
  }
}
