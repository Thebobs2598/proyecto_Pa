import 'package:flutter/material.dart';
import 'package:proyectopa/screens/listado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Pa',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Listado(),
    );
  }
}




