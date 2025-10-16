import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'assets.dart';

class LocalDB {
  static final LocalDB instance = LocalDB._init();
  static Database? _database;
  LocalDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('local_data.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, fileName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        image_path TEXT,
        original_price REAL NOT NULL,
        current_price REAL NOT NULL,
        sold_quantity INTEGER NOT NULL DEFAULT 0,
        category_id INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE packages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        details TEXT,
        price REAL NOT NULL,
        view_boost INTEGER NOT NULL DEFAULT 1,
        features TEXT,
        type TEXT,
        is_best_value INTEGER NOT NULL DEFAULT 0,
        is_highest_views INTEGER NOT NULL DEFAULT 0
      )
    ''');

    // Insert dummy data
    await _insertDummyData(db);
  }

  Future<void> _insertDummyData(Database db) async {
    // Categories
    final categories = [
      {'name': 'ملابس'},
      {'name': 'اكسسوارات'},
      {'name': 'الكترونيات'},
      {'name': 'عقارات'},
    ];
    for (var c in categories) {
      await db.insert('categories', c);
    }

    // Products
    final products = [
      {
        'title': 'قميص قطن',
        'description': 'قميص خفيف ومريح',
        'image_path': Assets.shirtProduct,
        'original_price': 79.99,
        'current_price': 59.99,
        'sold_quantity': 25,
        'category_id': 1, // ملابس
      },
      {
        'title': 'بنطال جينز',
        'description': 'مناسب لجميع المواسم',
        'image_path': Assets.jeansProduct,
        'original_price': 120.00,
        'current_price': 89.00,
        'sold_quantity': 12,
        'category_id': 1, // ملابس
      },
      {
        'title': 'ساعة يد ذهبية',
        'description': 'ساعة يد أنيقة من الذهب',
        'image_path': 'assets/images/categories_images/watches.png',
        'original_price': 299.99,
        'current_price': 249.99,
        'sold_quantity': 5,
        'category_id': 2, // اكسسوارات
      },
      {
        'title': 'حقيبة يد جلدية',
        'description': 'حقيبة يد أنيقة من الجلد الطبيعي',
        'image_path': Assets.handbagProduct,
        'original_price': 199.99,
        'current_price': 159.99,
        'sold_quantity': 8,
        'category_id': 2, // اكسسوارات
      },
      {
        'title': 'سماعات لاسلكية',
        'description': 'بلوتوث وإلغاء الضوضاء',
        'image_path': Assets.headphoneProduct,
        'original_price': 249.99,
        'current_price': 199.99,
        'sold_quantity': 15,
        'category_id': 3, // الكترونيات
      },
      {
        'title': 'ساعة ذكية',
        'description': 'تتبع اللياقة مع معدل نبضات القلب',
        'image_path': 'assets/images/categories_images/watches.png',
        'original_price': 199.99,
        'current_price': 149.49,
        'sold_quantity': 8,
        'category_id': 3, // الكترونيات
      },
      {
        'title': 'شقة 3 غرف',
        'description': 'شقة مفروشة في منطقة راقية',
        'image_path': 'assets/images/categories_images/villa.jpg',
        'original_price': 500000.00,
        'current_price': 450000.00,
        'sold_quantity': 1,
        'category_id': 4, // عقارات
      },
      {
        'title': 'فيلا 5 غرف',
        'description': 'فيلا مع حديقة وحمام سباحة',
        'image_path': 'assets/images/categories_images/villa.jpg',
        'original_price': 1200000.00,
        'current_price': 1000000.00,
        'sold_quantity': 1,
        'category_id': 4, // عقارات
      },
    ];
    for (var p in products) {
      await db.insert('products', p);
    }

    // Packages
    final packages = [
      {
        'title': 'أساسية',
        'details': 'صلاحية الأعلان 30 يوم',
        'price': 3000,
        'view_boost': 0,
        'features':
            '{"icon": "assets/images/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}',
        'type': null,
        'is_best_value': 0,
        'is_highest_views': 0,
      },
      {
        'title': 'أكسترا',
        'details':
            'صلاحية الأعلان 30 يوم + رفع لأعلى القائمة كل 3 أيام + تثبيت في مقاول صحي',
        'price': 4000,
        'view_boost': 7,
        'features':
            '{"icon": "assets/images/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}|{"icon": "assets/images/icons/rocket.svg", "title": "رفع لأعلى القائمة كل 3 أيام", "subtitle": null}|{"icon": "assets/images/icons/keep.svg", "title": "تثبيت في مقاول صحي", "subtitle": "( خلال ال48 ساعة القادمة )"}',
        'type': null,
        'is_best_value': 0,
        'is_highest_views': 0,
      },
      {
        'title': 'بلس',
        'details':
            'صلاحية الأعلان 30 يوم + رفع لأعلى القائمة كل 2 يوم + تثبيت في مقاول صحي + ظهور في كل محافظات مصر + أعلان مميز',
        'price': 5000,
        'view_boost': 18,
        'features':
            '{"icon": "assets/images/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}|{"icon": "assets/images/icons/rocket.svg", "title": "رفع لأعلى القائمة كل 2 يوم", "subtitle": null}|{"icon": "assets/images/icons/keep.svg", "title": "تثبيت في مقاول صحي", "subtitle": "( خلال ال48 ساعة القادمة )"}|{"icon": "assets/images/icons/globe.svg", "title": "ظهور في كل محافظات مصر", "subtitle": null}|{"icon": "assets/images/icons/workspace_premium.svg", "title": "أعلان مميز", "subtitle": null}|{"icon": "assets/images/icons/keep.svg", "title": "تثبيت في مقاول صحي في الجهراء", "subtitle": "( خلال ال48 ساعة القادمة )"}',
        'type': 'أفضل قيمة مقابل سعر',
        'is_best_value': 1,
        'is_highest_views': 0,
      },
      {
        'title': 'سوبر',
        'details':
            'صلاحية الأعلان 30 يوم + رفع لأعلى القائمة كل 2 يوم + تثبيت في مقاول صحي + ظهور في كل محافظات مصر + أعلان مميز',
        'price': 6000,
        'view_boost': 24,
        'features':
            '{"icon": "assets/images/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}|{"icon": "assets/images/icons/rocket.svg", "title": "رفع لأعلى القائمة كل 2 يوم", "subtitle": null}|{"icon": "assets/images/icons/keep.svg", "title": "تثبيت في مقاول صحي", "subtitle": "( خلال ال48 ساعة القادمة )"}|{"icon": "assets/images/icons/globe.svg", "title": "ظهور في كل محافظات مصر", "subtitle": null}|{"icon": "assets/images/icons/workspace_premium.svg", "title": "أعلان مميز", "subtitle": null}|{"icon": "assets/images/icons/keep.svg", "title": "تثبيت في مقاول صحي في الجهراء", "subtitle": "( خلال ال48 ساعة القادمة )"}',
        'type': 'أعلى مشاهدات',
        'is_best_value': 0,
        'is_highest_views': 1,
      },
    ];
    for (var b in packages) {
      await db.insert('packages', b);
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await instance.database;
    return await db.query('products');
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await instance.database;
    return await db.query('categories');
  }

  Future<List<Map<String, dynamic>>> getPackages() async {
    final db = await instance.database;
    return await db.query('packages');
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(
    int categoryId,
  ) async {
    final db = await instance.database;
    return await db.query(
      'products',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );
  }
}
