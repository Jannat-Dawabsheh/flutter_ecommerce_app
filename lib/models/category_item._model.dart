class CategoryItemModel{
  final String id;
  final String name;
  final String imgUrl;

  CategoryItemModel({
    required this.id, 
    required this.name, 
    required this.imgUrl});
}
List<CategoryItemModel> dummyCategories=[
  CategoryItemModel(id: '1', name: 'New Arrivals', imgUrl: 'https://www.newcastlesys.com/hubfs/2022/0412/220412-the-5-secrets-of-successful-ecommerce-fulfillment.jpeg'),
  CategoryItemModel(id: '2', name: 'Electronics', imgUrl: 'https://media.istockphoto.com/id/1460766261/photo/music-headphones-as-audio-equimpent-3d-illustration.jpg?s=612x612&w=0&k=20&c=UTNDOr6ckeMXNVTNjyHVT_-jORfJkAkL8Q1aFuBABI0='),
  CategoryItemModel(id: '3', name: 'Clothes', imgUrl: 'https://www.shutterstock.com/image-photo/stack-colorful-clothes-pile-clothing-600nw-2203081765.jpg'),
  CategoryItemModel(id: '4', name: 'Shoes', imgUrl: 'https://static.vecteezy.com/system/resources/thumbnails/024/023/129/small/banner-set-of-children-jeans-and-white-sneakers-casual-style-photo.jpg'),
  CategoryItemModel(id: '5', name: 'Bags', imgUrl: 'https://mygemma.com/cdn/shop/collections/New_Gemma_Banner_Size_56_1900x633.png?v=1638293491'),
  ];

