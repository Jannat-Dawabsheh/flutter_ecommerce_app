import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  void getPaymentViewData(){
    emit(PaymentLoading());
    final cartItems=dummyProducts.where((element) => element.isAddedToCart==true).toList();
    final cartItem=dummyProducts.where((element) => element.isAddedToCart==true).toList();
    final subTotal= cartItem.fold<double>(0, (sum, element) => sum+element.price);
    Future.delayed(const Duration(seconds: 1),(){
       emit(
        PaymentLoaded(
          cartItems: cartItems, 
          total: subTotal+10,
          )
       );
    });
  }
}
