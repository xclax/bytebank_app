import 'package:bytebank_app/database/app_database.dart';
import 'package:bytebank_app/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  AppDatabase _appDatabase = AppDatabase();

  static const String tableSql = ' CREATE TABLE $tableName('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER )';

  static const String tableName = 'contact';
  static const String id = 'id';
  static const String name = 'name';
  static const String accountNumber = 'account_number';

  Future save(Contact contato) async {
    Database db = await _appDatabase.createDatabase();
    Map<String, dynamic> contactMap = _toMap(contato);
    return db.insert(tableName, contactMap);
  }

  Future delete(Object? id) async {
    final db = await _appDatabase.createDatabase();
    return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Map<String, dynamic> _toMap(Contact contato) {
    Map<String, dynamic> contactMap = Map();
    contactMap[name] = contato.name;
    contactMap[accountNumber] = contato.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    Database db = await _appDatabase.createDatabase();
    List<Map<String, dynamic>> result = await db.query(tableName);
    List<Contact> contactList = _toList(result);
    return contactList;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    List<Contact> contactList = [];
    for (Map<String, dynamic> row in result) {
      Contact contato = Contact(
          id: row[id], name: row[name], accountNumber: row[accountNumber]);

      contactList.add(contato);
    }
    return contactList;
  }
}
