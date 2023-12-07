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
    imgUrl: 'https://mir-s3-cdn-cf.behance.net/project_modules/hd/b9cebc56206093.59a527509701d.jpg'
    ),

    HomeCarouselModel(
    id: '2', 
    imgUrl:'https://aircase.in/cdn/shop/files/Banner_2_e7648031-004f-441d-99ed-f446a515c681.jpg' 
    ),

    HomeCarouselModel(
    id: '3', 
    imgUrl: 'https://as1.ftcdn.net/v2/jpg/03/04/02/58/1000_F_304025842_YkdBbxD8C0rO1sHCvC8qM1LOSGVy7tvV.jpg'
    ),

    HomeCarouselModel(
    id: '4', 
    imgUrl: 'https://sc04.alicdn.com/kf/H1c0d158c2b044e44b29671cf0ba46cc61/228438898/H1c0d158c2b044e44b29671cf0ba46cc61.jpg'
    ),
];