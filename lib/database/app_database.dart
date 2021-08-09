import 'package:bytebank_app/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return openDatabase(join(dbPath, 'bytebank.db'), onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    }, onDowngrade: onDatabaseDowngradeDelete, version: 1);
  }
}
