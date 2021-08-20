import 'package:bytebank_app/screens/dashboard_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());

}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[700],
        accentColor: Colors.cyan[800],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.cyan[800]),
        ),
      ),
      home: DashboardPage(),
    );
  }
}
