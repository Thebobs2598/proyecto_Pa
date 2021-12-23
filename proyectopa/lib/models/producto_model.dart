class Producto {
  int id;
  String name;
  double pvp;
  double iva;

  Producto(this.id, this.name, this.pvp, this.iva);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'pvp': pvp, 'iva': iva};
  }
}
