class HomeCarouselModel{
  final String id;
  final String imgUrl;

  HomeCarouselModel({
    required this.id, 
    required this.imgUrl
    });
  
}
List<HomeCarouselModel> dummyCarousel=[
  HomeCarouselModel(
    id: '1', 
    imgUrl: 'https://www.shutterstock.com/image-vector/ecommerce-website-banner-template-presents-260nw-2252124451.jpg'
    ),

    HomeCarouselModel(
    id: '2', 
    imgUrl: 'https://www.shutterstock.com/image-vector/sale-banner-template-design-discount-260nw-1071395276.jpg'
    ),

    HomeCarouselModel(
    id: '3', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjCHL5eR7DdOWwix_V6K9jeFvo1N9dVVQJQkipVO0BDM_-tlVoOdawtQjjjCOuyAPSTHs&usqp=CAU'
    ),

    HomeCarouselModel(
    id: '4', 
    imgUrl: 'https://t4.ftcdn.net/jpg/03/06/69/49/360_F_306694930_S3Z8H9Qk1MN79ZUe7bEWqTFuonRZdemw.jpg'
    ),
];