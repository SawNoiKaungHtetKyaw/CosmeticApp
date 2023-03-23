import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database _db;

  final String tableName = 'my_shopping_carts';
  final String favTable = 'my_fav';

  //Create Database
  Future<Database> _createDatabase() async {
    var dataPath = await getDatabasesPath(); //db folder
    String path = join(dataPath, 'products.db'); // db name
    _db = await openDatabase(path);

    //create Table in db
    await _db.execute('CREATE TABLE IF NOT EXISTS $tableName(id INTEGER PRIMARY KEY,product_id INTEGER,product_count INTEGER,product_brand TEXT,product_name TEXT,product_price TEXT,product_image_link TEXT,product_description TEXT,product_rating DOUBLE,product_type TEXT,product_api_url TEXT)');
    await _db.execute('CREATE TABLE IF NOT EXISTS $favTable(id INTEGER PRIMARY KEY,product_id INTEGER)');
    return _db;
  }

  //create insert Fav method
  Future<int> insertFavProduct(Map<String,dynamic> fav) async{
    _db = await _createDatabase();
    return await _db.insert(favTable, fav);
  }

  //create insert method
  Future<int> insertProduct(Map<String, dynamic> product) async {
    _db = await _createDatabase();
    return await _db.insert(tableName, product);
  }

  //crate get All Fav method
  Future<List<Map<String,dynamic>>> getAllFav() async{
    _db = await _createDatabase();
    return await _db.query(favTable,columns: ['id','product_id']);
  }

  //crate get All method
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    _db = await _createDatabase();
    return await _db.query(tableName, columns: [
      'id',
      'product_count',
      'product_id',
      'product_brand',
      'product_name',
      'product_price',
      'product_image_link',
      'product_description',
      'product_rating',
      'product_type',
      'product_api_url'
    ]);
  }

  //create update method
  Future<int> updateProduct (Map<String,dynamic> product,int id) async{
    _db = await _createDatabase();
    return await _db.update(tableName, product ,where: "id=?" , whereArgs: [id]);
  }

  //Delete method
  Future<int> deleteFav(int id) async {
    _db = await _createDatabase();
    return await _db.delete(favTable,where: 'product_id=?' , whereArgs: [id]);
  }

  //Delete method
  Future<int> deleteProduct (int id) async{
    _db = await _createDatabase();
    return await _db.delete(tableName,where: 'id=?',whereArgs: [id]);
  }

  //Delete All
  Future<int> deleteAll() async{
    _db = await _createDatabase();
    return await _db.rawDelete('DELETE FROM $tableName');
  }

  Future<int> deleteAllFav() async{
    _db = await _createDatabase();
    return await _db.rawDelete('DELETE FROM $favTable');
  }
}
