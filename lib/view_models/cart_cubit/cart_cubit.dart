import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCartItems(){
    emit(CartLoading());
    final cartItem=dummyProducts.where((element) => element.isAddedToCart==true).toList();
    final subTotal= cartItem.fold<double>(0, (sum, element) => sum+element.price);
    Future.delayed(const Duration(seconds: 1),(){
      emit(CartLoaded(cartItems:cartItem, subTotal: subTotal ));
    });
  }
  
  void increment(String productId){
    final index=dummyProducts.indexWhere((element) => element.id==productId);
    dummyProducts[index]=dummyProducts[index].copyWith(quantity:dummyProducts[index].quantity+1);
    emit(QuantityCounterLoaded(value: dummyProducts[index].quantity, productId:productId));
  }

   void decrement(String productId){
    final index=dummyProducts.indexWhere((element) => element.id==productId);
    dummyProducts[index]=dummyProducts[index].copyWith(quantity:dummyProducts[index].quantity-1);
    emit(QuantityCounterLoaded(value: dummyProducts[index].quantity, productId:productId));
  }

  void removeFromCart(String productId){
    emit(CartLoading());
    final index=dummyProducts.indexWhere((element) => element.id==productId);
    dummyProducts[index]=dummyProducts[index].copyWith(isAddedToCart:false, quantity: 0, size: null);
    emit(QuantityCounterLoaded(value: dummyProducts[index].quantity, productId:productId));
    final cartItem=dummyProducts.where((element) => element.isAddedToCart==true).toList();
    final subTotal= cartItem.fold<double>(0, (sum, element) => sum+element.price);
    Future.delayed(const Duration(seconds: 1),(){
      emit(CartLoaded(cartItems: cartItem, subTotal: subTotal));
    });
  }
}
