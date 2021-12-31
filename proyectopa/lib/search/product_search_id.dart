import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProductSearchIdDelegate extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('productos');

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
    if (query.trim().isEmpty) return const Text('no ingresó nada');
    
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
              ),
            );
          } else {
            ///fetch data here
            return ListView(
              children: [
                ...snapshot.data!.docs.where(
                    (QueryDocumentSnapshot<Object?> element) => element['id']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {
                          final String id = data.get('id');
                          final String name = data.get('name');
                          final String pvp = data.get('pvp').toString();
                          final String iva = data.get('iva').toString();

                          return ListTile(
                            title: Text(id),
                            subtitle: Text(name),
                            trailing: Column(
                              children: [
                                Text('pvp: $pvp'),
                                Text('iva: $iva')
                              ],
                            ), 

                          );
                        })
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(
      title: Text('Suggestions'),
    );
  }
}
