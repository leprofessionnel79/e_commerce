import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _categoryCollectionREF =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productsCollectionREF =
      FirebaseFirestore.instance.collection('Products');
    

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionREF.get();

    return value.docs;
  }

   Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productsCollectionREF.get();

    return value.docs;
  }
}
