

import 'package:flutter/material.dart';
import 'package:proyectopa/search/product_search_id.dart';
import 'package:proyectopa/search/product_search_name.dart';

class ListadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Sistema de Busquedas NOVUM',style: TextStyle(fontSize: 25,color: Colors.black),),
            MaterialButton(
                child: const Text(
                  'Buscar por Código',
                  style: TextStyle(color: Colors.white),
                ),
                shape: const StadiumBorder(),
                elevation: 0,
                splashColor: Colors.transparent,
                color: Colors.deepPurple,
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: ProductSearchIdDelegate());
                }),
                MaterialButton(
                child: const Text(
                  'Buscar por Nombre',
                  style: TextStyle(color: Colors.white),
                ),
                shape: const StadiumBorder(),
                elevation: 0,
                splashColor: Colors.transparent,
                color: Colors.deepPurple,
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: ProductSearchNameDelegate());
                })
          ],
        ),
      ),
    );
  }
}
