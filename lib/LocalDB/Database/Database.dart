import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/CartItem.dart';
import '../Models/FavoriteItem.dart';

class CartDatabaseHelper {
  static final CartDatabaseHelper _instance = CartDatabaseHelper._internal();

  factory CartDatabaseHelper() => _instance;

  CartDatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<CartItem?> getCartItemByProductId(int productId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(
      'cart',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    if (maps.isEmpty) {
      return null;
    }

    return CartItem.fromJson(maps.first);
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'well.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createDb(db);
      },
    );
  }

  Future<void> _createDb(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS cart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER NOT NULL,
        size_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        size TEXT NOT NULL,
        color TEXT NOT NULL,
        notes TEXT NOT NULL,
        categoryID INTEGER NOT NULL,
        image TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        sizes TEXT NOT NULL,
        sizesIDs TEXT NOT NULL,
        colorsNames TEXT NOT NULL,
        color_id INTEGER NOT NULL,
        colorsImages TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS favorites (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER NOT NULL,
        categoryID INTEGER NOT NULL,
        name TEXT NOT NULL,
        image TEXT NOT NULL
      )
    ''');
  }

  Future<FavoriteItem?> getFavoriteItemByProductId(int productId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(
      'favorites',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    if (maps.isEmpty) {
      return null;
    }

    return FavoriteItem.fromJson(maps.first);
  }

  Future<int> insertFavoriteItem(FavoriteItem item) async {
    final db = await database;
    return await db!.insert('favorites', item.toJson());
  }

  Future<List<FavoriteItem>> getFavoriteItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('favorites');
    return List.generate(
      maps.length,
      (i) => FavoriteItem.fromJson(maps[i]),
    );
  }

  Future<void> deleteFavoriteItem(int id) async {
    final db = await database;
    await db!.delete('favorites', where: 'productId = ?', whereArgs: [id]);
  }

  // Method to clear the cart database
  Future<void> clearCart() async {
    final db = await database;
    await db!.delete('cart'); // Delete all records from the 'cart' table
  }

  Future<int> insertCartItem(CartItem item) async {
    final db = await database;
    return await db!.insert('cart', {
      'productId': item.productId,
      'name': item.name,
      'color': item.color,
      'notes': item.notes,
      'categoryID': item.categoryID,
      'image': item.image,
      'size': item.size,
      'color_id': item.color_id,
      'quantity': item.quantity,
      'size_id': item.size_id,
      'sizes': item.sizes.join(','),
      'sizesIDs': item.sizesIDs.join(','),
      'colorsNames': item.colorsNames.join(','),
      'colorsImages': item.colorsImages.join(','),
    });
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('cart');
    return List.generate(
      maps.length,
      (i) => CartItem.fromJson(maps[i]),
    );
  }

  Future<void> deleteCartItem(int id) async {
    final db = await database;
    await db!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateCartItem(CartItem item) async {
    final db = await database;
    await db!.update(
      'cart',
      item.toJson(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }
}
