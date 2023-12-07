import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/models/home_carousel_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());

  void getHomeData(){
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 2),(){
       emit(
        HomeLoaded(
          products: dummyProducts, 
          carouselItems: dummyCarousel,
          )
       );
    });
  }
}
