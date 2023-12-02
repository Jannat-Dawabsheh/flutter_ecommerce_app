class ProductItemModel{
  final String id;
  final String name;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final double price;
  final String category;

  ProductItemModel({
    required this.id, 
    required this.name, 
    required this.imgUrl, 
    this.isFavorite=false, 
    this.description="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ", 
    required this.price, 
    required this.category
});
}
List<ProductItemModel> dummyProducts=[
  ProductItemModel(
    id: '1', 
    name: 'T-shirt', 
    imgUrl: 'https://www.freepnglogos.com/uploads/t-shirt-png/t-shirt-png-blank-shirt-transparent-png-pictures-icons-and-28.png', 
    price: 10, 
    category: 'Clothes'
    ),

    ProductItemModel(
    id: '2', 
    name: 'Trouser', 
    imgUrl: 'https://cdn11.bigcommerce.com/s-wzns5i/images/stencil/500x659/products/953/2484/Pant----Boy-Khaki__55768.1567764102.png?c=2', 
    price: 15, 
    category: 'Clothes'
    ),

    ProductItemModel(
    id: '3', 
    name: 'black shoes', 
    imgUrl: 'https://pngimg.com/uploads/men_shoes/men_shoes_PNG7475.png', 
    price: 15, 
    category: 'shoes'
    ),

    ProductItemModel(
    id: '4', 
    name: 'black pag', 
    imgUrl: 'https://pngimg.com/uploads/women_bag/women_bag_PNG6415.png', 
    price: 10, 
    category: 'pags'
    ),
];
