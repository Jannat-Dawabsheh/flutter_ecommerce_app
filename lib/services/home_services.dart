import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/services/firestore_services.dart';
import 'package:flutter_ecommerce_app/utils/api_path.dart';

abstract class HomeServices{
   Future<List<ProductItemModel>>getProducts();
   Future<void>addProduct(ProductItemModel product);
   Future<void>deleteProduct(String id);
   Stream<List<ProductItemModel>>getProductsStream();
}

class HomeServicesImpl implements HomeServices{
  final firestore=FirestoreServices.instance;
   
   @override
   Future<List<ProductItemModel>>getProducts()async {
   return await firestore.getCollection<ProductItemModel>(path: ApiPath.products(), builder: (data,documentId)=>ProductItemModel.fromMap(data, documentId));
   }
  
  @override
  Stream<List<ProductItemModel>>getProductsStream() {
    return  firestore.collectionStream<ProductItemModel>(path: ApiPath.products(), builder: (data,documentId)=>ProductItemModel.fromMap(data, documentId));
  
  }
  
  @override
  Future<void> addProduct(ProductItemModel product)async =>await firestore.setData(path: ApiPath.product(product.id), data: product.toMap());
  
  @override
  Future<void> deleteProduct(String id)async =>await firestore.deleteData(path: ApiPath.product(id));

}


