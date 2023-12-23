part of 'favorite_cubit.dart';


 class FavoriteState {}
 class favoriteLoadingState extends FavoriteState{}
 class favoriteLoadedState extends FavoriteState{
    final List<ProductItemModel>products;
    favoriteLoadedState(this.products);
 }
  



