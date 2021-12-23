import 'dart:core';

import 'package:flutter/material.dart';
import 'package:proyectopa/db/db.dart';
import 'package:proyectopa/models/producto_model.dart';

class Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Productos"),
        ),
        body: Lista());
  }
}

class Lista extends StatefulWidget {
  @override
  _MiLista createState() => _MiLista();
}

class _MiLista extends State<Lista> {
  List<Producto> productos = [];

  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<Producto> auxProducto = await DB.getProductos();

    setState(() {
      productos = auxProducto;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    print(productos);
    return ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, i) => ListTile(
            title: Text(productos[i].name),
            trailing: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/editar",
                      arguments: productos[i]);
                },
                child: Icon(Icons.edit))));
  }
}
