import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyectopa/models/producto_model.dart';
import 'package:proyectopa/services/products_service.dart';

class ListadoPage extends StatefulWidget {
  const ListadoPage({Key? key}) : super(key: key);

  @override
  _ListadoPageState createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {
  StreamSubscription? _loadProducto;
  Producto? producto;
  final productService = ProductService();
  @override
  void initState() {
    // TODO: implement initState
    _loadProducto = productService.load$('id').listen((producto) {
      setState(() {
        this.producto = producto;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
