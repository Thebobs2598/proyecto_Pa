


class Producto {
  final String? id;
  final String? name;
  final double? pvp;
  final double? iva;


  Producto({this.id, this.name, this.pvp, this.iva});

  

  Producto.fromMap(Map<String, dynamic> map)
      : id = map['id'] as String,
        name = map['name'] as String,
        iva = map['iva'] as double,
        pvp = map['pvp'] as double;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'pvp': pvp,
      'iva': iva,      
    };
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'pvp': pvp, 'iva': iva};
  }
}
