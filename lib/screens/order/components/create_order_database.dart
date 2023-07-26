import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CreateOrderDatabase {
  Database? db;

  Future<void> init() async {
    print('getting databse');
    Directory databasesPath = await getApplicationDocumentsDirectory();
    String path = join(databasesPath.path, 'order.db');
    print('databse inititated');
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) async {
      print('making table');
      await newDb.execute(
          'CREATE TABLE Test (uid TEXT , orderdetails BLOB, date TEXT, time TEXT, datetime TEXT, total INTEGER,storename TEXT)');
      print('table made');
    });
  }

  Future<int> additem(
      {String? uid,
      String? date,
      String? time,
      String? datetime,
      String? storename,
      int? total,
      List? order}) async {
    print('inserting started');
    print(await getApplicationDocumentsDirectory());
    List dblist = await db!.rawQuery('SELECT total FROM Test');
    print('DBLIST: $dblist');
    return db!.insert(
      'Test',
      {
        'uid': uid,
        'date': date,
        'time': time,
        'datetime': datetime,
        'storename': storename,
        'total': total,
        'orderdetails': jsonEncode(order)
      },
    );
  }
}
