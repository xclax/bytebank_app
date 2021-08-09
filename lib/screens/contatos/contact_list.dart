import 'package:bytebank_app/database/dao/contact_dao.dart';
import 'package:bytebank_app/models/contact.dart';
import 'package:bytebank_app/screens/contatos/contact_form_page.dart';
import 'package:bytebank_app/widgets/loading_progress_centered_widget.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  ContactDao _dao = ContactDao();
  static const appBarTitle = 'Contact List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            List<Contact>? contactList = snapshot.data;
            if (contactList != null) {
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
                    itemCount: contactList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            title: Text(contactList[index].name.toString()),
                            subtitle: Text(
                                contactList[index].accountNumber.toString()),
                            trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Text("Delete"),
                                        value: contactList[index].id,
                                      ),
                                    ],
                                onSelected: (id) {
                                  setState(() {
                                    _dao.delete(id);
                                  });
                                })),
                      );
                    },
                  );
              }
            }
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          goToContactFormPage(context);
        },
      ),
    );
  }

  Future<dynamic> goToContactFormPage(BuildContext context) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContactFormPage();
    }));
  }
}
