import 'package:bytebank_app/screens/contact/contact_list_page.dart';
import 'package:bytebank_app/screens/transaction/transaction_list_page.dart';
import 'package:bytebank_app/widgets/card_title_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const title = 'Dashboard';
  static const contactsTitle = 'Contacts';
  static const transactionFeedTitle = 'Transaction Feed';
  static const newTransactionTitle = 'New Transaction';
  static const IconData contactsIcon = Icons.person;
  static const IconData transactionFeedIcon = Icons.analytics_outlined;
  static const IconData newTransactionIcon = Icons.attach_money_rounded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/bytebank_logo.png'),
            SafeArea(
              child: Container(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardTitleWidget(
                      title: contactsTitle,
                      icon: contactsIcon,
                      onClick: () => navigateToPage(context, ContactListPage()),
                    ),
                    CardTitleWidget(
                      title: newTransactionTitle,
                      icon: newTransactionIcon,
                      onClick: () => navigateToPage(context, ContactListPage()),
                    ),
                    CardTitleWidget(
                      title: transactionFeedTitle,
                      icon: transactionFeedIcon,
                      onClick: () {
                        navigateToPage(context, TransactionListPage());
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> navigateToPage(BuildContext context, Widget page) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
  }
}
