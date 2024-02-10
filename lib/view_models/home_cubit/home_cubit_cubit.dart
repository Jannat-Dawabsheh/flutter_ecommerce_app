import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/home_carousel_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/services/home_services.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());
  final homeServices= HomeServicesImpl();

  Future<void>addProduct(ProductItemModel product)async{
    await homeServices.addProduct(product);
  }

  Future<void>deleteProduct(String id)async{
    await homeServices.deleteProduct(id);
  }

 
  Future<void> getHomeData() async {
    emit(HomeLoading());
    // final products = homeServices.getProductsStream();
    // products.listen((event) {
    //   emit(
    //     HomeLoaded(
    //       products: event,
    //       carouselItems: dummyCarouselItems,
    //     ),
    //   );
    // });
    final products = await homeServices.getProducts();
    emit(
        HomeLoaded(
          products: products,
          carouselItems: dummyCarousel,
        ),
      );
  }
}
