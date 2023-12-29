enum Size{S,M,L,XL}

class ProductItemModel{
  final String id;
  final String name;
  final String imgUrl;
   final bool isFavorite;
  final String description;
  final double price;
  final String category;
  final int quantity;
  final Size? size;
  final bool isAddedToCart;

  const ProductItemModel({
    required this.id, 
    required this.name, 
    required this.imgUrl, 
    this.isFavorite=false, 
    this.description="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ", 
    required this.price, 
    required this.category,
    this.quantity=0, 
    this.size,
    this.isAddedToCart=false
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
   Size? size,
   bool? isAddedToCart,
}){
  return ProductItemModel(
    id: id??this.id, 
    name: name??this.name, 
    imgUrl: imgUrl??this.imgUrl,
    isFavorite: isFavorite??this.isFavorite,
    description:description??this.description,
    price: price??this.price, 
    category: category??this.category,
    quantity:quantity??this.quantity,
    size:size??this.size,
    isAddedToCart:isAddedToCart??this.isAddedToCart,
    );
}
}
 List<ProductItemModel> dummyProducts=[
  const ProductItemModel(
    id: '1', 
    name: 'T-shirt', 
    imgUrl: 'https://static.vecteezy.com/system/resources/thumbnails/008/847/318/small/isolated-black-t-shirt-front-free-png.png', 
    price: 10, 
    category: 'Clothes',
    isAddedToCart: true,
    size: Size.S,
    quantity: 2
    ),

    const ProductItemModel(
    id: '2', 
    name: 'Trouser', 
    imgUrl: 'https://cdn11.bigcommerce.com/s-wzns5i/images/stencil/500x659/products/953/2484/Pant----Boy-Khaki__55768.1567764102.png?c=2', 
    price: 15, 
    category: 'Clothes',
    isAddedToCart: true,
    size: Size.M,
    quantity: 1
    ),

    const ProductItemModel(
    id: '3', 
    name: 'black shoes', 
    imgUrl: 'https://static.wixstatic.com/media/3fa4d8_1c395487f90e4138abb19cf29055c821~mv2.png/v1/fit/w_900%2Ch_700%2Cal_c/file.png', 
    price: 15, 
    category: 'shoes'
    ),

    const ProductItemModel(
    id: '4', 
    name: 'black pag', 
    imgUrl: 'https://eng.polene-paris.com/cdn/shop/products/packshot-front_numero-sept-mini-noir-lisse.png?v=1682352228', 
    price: 10, 
    category: 'pags',
    isAddedToCart: true,
    quantity: 2
    ),
];
