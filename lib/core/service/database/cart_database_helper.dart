
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../shared/constants/constants.dart';

class CartDatabaseHelper{
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database ;
  Future<Database?> get database async{
  if (_database != null) return _database;
  _database = await initDb();
  return _database;


}


  initDb() async{
  String path = join(await getDatabasesPath() , 'CartProduct.db');
  return await openDatabase(path ,
  version: 1 ,onCreate: (Database db , int version )  async {
    await db.execute(''' 
    CREAT TABLE $tableCartProduct (
    $columnName TEXT NOT NULL,
    $columnImage TEXT NOT NULL,
    $columnPrice TEXT NOT NULL,
    $columnQuantity INTEGER NOT NULL)
    ''');
  });

}



}
