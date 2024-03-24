import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/services/cart_services.dart';
import 'package:flutter_ecommerce_app/services/product_details_services.dart';

import '../../models/payment_method_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final cartServices = CartServicesImpl();

  Future<void> getPaymentViewData() async {
    emit(PaymentLoading());
      final cartItems = await cartServices.getCartItems();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + (item.product.price * item.quantity));
    emit(PaymentLoaded(
        cartItems: cartItems,
        total: subTotal,
      ));
    
    }

  void choosePaymentMethod(String PaymentMethodId){
    final PaymentMethodModel chosedCard;
    chosedCard=savedCards.where((element) => element.id==PaymentMethodId,).toList()[0];
    emit(PaymentMethodChosen(paymentMethodId: PaymentMethodId,chosedCard ));
    print('choose pay');
  }
}
