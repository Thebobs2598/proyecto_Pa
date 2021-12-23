import 'package:proyectopa/models/producto_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'productos.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE productos (id, name TEXT, pvp DECIMAL,iva DECIMAL)");
    }, version: 1);
  }

  static Future<List<Producto>> getProductos() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> productosMap =
        await database.query('productos');
    return List.generate(
        productosMap.length,
        (i) => Producto(productosMap[i]['id'], productosMap[i]['name'],
            productosMap[i]['pvp'], productosMap[i]['iva']));
  }
}
