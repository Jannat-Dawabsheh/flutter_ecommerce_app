

import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/services/auth_services.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';
import 'package:flutter_ecommerce_app/utils/api_path.dart';

abstract class CartServices {
  Future<List<AddToCartModel>> getCartItems();
}

class CartServicesImpl implements CartServices {
  final firestore = FirestoreServices.instance;
  final authServices = AuthServicesImpl();

  @override
  Future<List<AddToCartModel>> getCartItems() async {
    final currentUser = await authServices.getUser();
    return await firestore.getCollection(
      path: ApiPath.getCartItems(currentUser!.uid),
      builder: (data, documentId) => AddToCartModel.fromMap(data, documentId),
    );
  }
}
