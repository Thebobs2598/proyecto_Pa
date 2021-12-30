import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyectopa/services/products_service.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => this.query = '', icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length == 0) {
      return Text('no hya valor');
    }
    // final productService = ProductService();
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('productos').doc(query).snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)return const Center(child: CircularProgressIndicator(strokeWidth: 4,));

          final results =
          snapshot.data.documents.where((a) => a['id'].contains(query));
             
          //tenemos data
          // return Text('TENEMOS DATA + $results');
          return ListView(
        children: results.map<Widget>((a) => Text(a['title'])).toList(),);
          
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(
      title: Text('Suggestions'),
    );
  }
}
