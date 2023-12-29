import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_item_model.dart';

part 'favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {
  final Map<String,bool>favoratieProducts={};
  FavoriteCubit() : super(FavoriteState());


    Future<void> addFavorite(String productId) async{
    emit(favoriteLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    favoratieProducts[productId]=true;
    //final favoriteList=dummyProducts.where((element) => (favoratieProducts[element.id]??false)).toList();
     final favoriteList=dummyProducts.where(((element) =>element.isFavorite==true)).toList();
    print("add $favoratieProducts");
    //dummyProducts.where((element) => (element.id==productId)).toList()[0].isFavorite=true;
    emit(favoriteLoadedState(favoriteList));
    
  }

    Future<void> deleteFavorite(String productId) async{
    emit(favoriteLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    favoratieProducts[productId]=false;
    print("delete $productId");
    final favoriteList=dummyProducts.where((element) => (favoratieProducts[element.id]??false)).toList();
     // final favoriteList=dummyProducts.where(((element) =>element.isFavorite==true)).toList();
    //dummyProducts.where((element) => (element.id==productId)).toList()[0].isFavorite=false;
    emit(favoriteLoadedState(favoriteList));
  }

   Future<void> getFavorite()async{
    emit(favoriteLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    print("getFavorite: $favoratieProducts");
    final favoriteList=dummyProducts.where((element) => (favoratieProducts[element.id]??false)).toList();
    // final favoriteList=dummyProducts.where(((element) =>element.isFavorite==true)).toList();
    emit(favoriteLoadedState(favoriteList));
    
  }

}
