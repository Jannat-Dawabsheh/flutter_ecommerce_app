import 'package:flutter/foundation.dart';


enum ProductSize {
  S,
  M,
  L,
  XL;

  factory ProductSize.fromString(String size) {
    return ProductSize.values.firstWhere((element) => element.name == size);
  }
}

class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final double price;
  final String category;
  final int quantity;
  final ProductSize? size;
  final bool isAddedToCart;
  final double averageRate;

  const ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.isFavorite = false,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.',
    required this.price,
    required this.category,
    this.quantity = 0,
    this.size,
    this.isAddedToCart = false,
    this.averageRate = 0.0,
  });

  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    bool? isFavorite,
    String? description,
    double? price,
    String? category,
    int? quantity,
    ProductSize? size,
    bool? isAddedToCart,
    double? averageRate,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      averageRate: averageRate ?? this.averageRate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'isFavorite': isFavorite});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'category': category});
    result.addAll({'quantity': quantity});
    result.addAll({'averageRate': averageRate});
    if (size != null) {
      result.addAll({'size': size!.name});
    }
    result.addAll({'isAddedToCart': isAddedToCart});

    return result;
  }

  factory ProductItemModel.fromMap(
      Map<String, dynamic> data, String documentId) {
    return ProductItemModel(
      id: documentId,
      name: data['name'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
      isFavorite: data['isFavorite'] ?? false,
      description: data['description'] ?? '',
      price: data['price']?.toDouble() ?? 0.0,
      category: data['category'] ?? '',
      quantity: data['quantity']?.toInt() ?? 0,
      size: data['size'] != null ? ProductSize.fromString(data['size']) : null,
      isAddedToCart: data['isAddedToCart'] ?? false,
      averageRate: data['averageRate'] ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'ProductItemModel(id: $id, name: $name, imgUrl: $imgUrl, isFavorite: $isFavorite, description: $description, price: $price, category: $category, quantity: $quantity, size: $size, isAddedToCart: $isAddedToCart)';
  }
}


 List<ProductItemModel> dummyProducts=[
  const ProductItemModel(
    id: 'Mj5DxIcoQncdUu0Lt2uB', 
    name: 'T-shirt', 
    imgUrl: 'https://static.vecteezy.com/system/resources/thumbnails/008/847/318/small/isolated-black-t-shirt-front-free-png.png', 
    price: 10, 
    category: 'Clothes',
    isAddedToCart: true,
    size: ProductSize.S,
    quantity: 2,
    ),

    const ProductItemModel(
    id: '7SW82H5cn3kOZT52H0AN', 
    name: 'Trouser', 
    imgUrl: 'https://cdn11.bigcommerce.com/s-wzns5i/images/stencil/500x659/products/953/2484/Pant----Boy-Khaki__55768.1567764102.png?c=2', 
    price: 15, 
    category: 'Clothes',
    isAddedToCart: true,
    size: ProductSize.M,
    quantity: 1
    ),

    const ProductItemModel(
    id: 'zREhnkfoXdIWPjmDXCif', 
    name: 'black shoes', 
    imgUrl: 'https://static.wixstatic.com/media/3fa4d8_1c395487f90e4138abb19cf29055c821~mv2.png/v1/fit/w_900%2Ch_700%2Cal_c/file.png', 
    price: 15, 
    category: 'shoes',
    size: ProductSize.M,
    ),

    const ProductItemModel(
    id: 'GmosKR4EgZaSK3BUsYMD', 
    name: 'black pag', 
    imgUrl: 'https://eng.polene-paris.com/cdn/shop/products/packshot-front_numero-sept-mini-noir-lisse.png?v=1682352228', 
    price: 10, 
    category: 'pags',
    isAddedToCart: true,
    quantity: 2,
    size: ProductSize.M,
    ),
];
