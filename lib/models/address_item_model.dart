class AddressItemModel{
  final String id;
  final String city;
  final String fullAddress;
  final String imgUrl;
  final bool isSelected;

  AddressItemModel({
    required this.id,
    required this.city, 
    required this.fullAddress, 
    required this.imgUrl,
    this.isSelected=false
    });

AddressItemModel copyWith({
   String? id,
   String? city,
   String? fullAddress,
   String? imgUrl,
   bool? isSelected,
   }){
  return AddressItemModel(
    id: id??this.id,
    city: city??this.city, 
    fullAddress: fullAddress??this.fullAddress, 
    imgUrl: imgUrl??this.imgUrl,
    isSelected: isSelected??this.isSelected,
    );
}
}
List<AddressItemModel> addressList=[
  AddressItemModel(id:'1',city: 'Los Angeles', fullAddress: 'Los Angeles, United States', imgUrl: 'https://media.istockphoto.com/id/1178423022/vector/los-angeles-county-regions-map-with-flag.jpg?s=612x612&w=0&k=20&c=iLmdS5EStUkfZCap93oLJuX-MEoBF8u2XzmOluIaxAg='),
  AddressItemModel(id:'2',city: 'San Francisco', fullAddress: 'San Francisco, United States', imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS603uUtmj-yspyejE2B4YRPqhINhA7jO4ATuKNOcKCvxcRdTgHi4kGG0hE0pa1ietXqSw&usqp=CAU'),
  AddressItemModel(id:'3',city: 'New York', fullAddress: 'New York, United States', imgUrl: 'https://thumbs.dreamstime.com/b/vector-map-new-york-highly-detailed-political-all-regions-roads-rivers-elements-separated-editable-layers-120743114.jpg'),
  ];