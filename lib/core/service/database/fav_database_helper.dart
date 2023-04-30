import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/models/fav_product_model.dart';
import 'package:untitled/shared/constants/constants.dart';

class FavDatabaseHelper{
  FavDatabaseHelper._();

  static final FavDatabaseHelper db = FavDatabaseHelper._();

  static Database? _database ;
  Future<Database?> get database async{
    if (_database != null) return _database;
    _database = await initDb();
    return _database;


  }

  initDb() async{
    String path = join(await getDatabasesPath() , 'FavProduct.db');
    return await openDatabase(path ,
        version: 1 ,onCreate: (Database db , int version )  async {
          await db.execute(''' 
    CREATE TABLE $tableFavProduct (
    $columnName_f TEXT NOT NULL,
    $columnImage_f TEXT NOT NULL,
    $columnPrice_f TEXT NOT NULL,
    $columnDescription_f TEXT NOT NULL,
    $columnId_f TEXT NOT NULL)
    ''');
        });
  }

  Future<List<FavProductModel>> getAllProduct() async{
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableFavProduct);
    List<FavProductModel> list =maps.isNotEmpty ? maps.map((product) => FavProductModel.fromJson(product)).toList() : [];
    return list;
  }

  insert(FavProductModel model) async{
    var dbClient = await database;
    await dbClient!.insert(tableFavProduct, model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(FavProductModel model) async{
    var dbClient = await database;
    await dbClient!.update(tableFavProduct, model.toJson(),where: '$columnId_f =?',whereArgs: [model.id]);
  }

  delete(FavProductModel model) async{
    var dbClient = await database;
    await dbClient!.delete(tableFavProduct, where: '$columnId_f = ?' , whereArgs: [model.id]);
  }
}
