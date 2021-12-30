// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:proyectopa/models/producto_model.dart';


// class ProductService {
//   ProductService() : _firestore = FirebaseFirestore.instance;
//   final FirebaseFirestore _firestore;

//   Stream<Producto?> load$(String id) {
//     return _firestore
//         .collection('productos')
//         .doc(id)
//         .snapshots().data.documents
//         .map((snapshot) => snapshot.data())
//         .map((data) => data == null ? null : Producto.fromMap(data));
//   }
// }
