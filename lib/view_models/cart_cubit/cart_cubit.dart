import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/services/cart_services.dart';
import 'package:flutter_ecommerce_app/services/product_details_services.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final cartServices = CartServicesImpl();
  final productDetailsServices = ProductDetailsServicesImpl();
  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      final cartItems = await cartServices.getCartItems();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + (item.product.price * item.quantity));
    emit(CartLoaded(
        cartItems: cartItems,
        subtotal: subTotal,
      ));
    } catch (e) {
      emit(
        CartError(message: e.toString()),
      );
    }
  }

  Future<void> removeFromCart(String productId) async {
     
    emit(CartLoading());
    try{
    await productDetailsServices.deleteFromCart(productId);
    final cartItems = await cartServices.getCartItems();
    emit(CartLoaded(cartItems:cartItems, subtotal:  cartItems.fold<double>(0, (sum, item) => sum + (item.product.price * item.quantity) )));
    }catch (e) {
      emit(
        CartError(message: e.toString()),
      );
    }
  }

  void increment(String productId) {
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      quantity: dummyProducts[index].quantity + 1,
    );
    emit(
      QuantityCounterLoaded(
        value: dummyProducts[index].quantity,
        productId: productId,
      ),
    );
    // emit(CartLoaded(
    //     cartItems: dummyProducts
    //         .where((item) => item.isAddedToCart == true)
    //         .toList()));
  }

  void decrement(String productId) {
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      quantity: dummyProducts[index].quantity - 1,
    );
    emit(QuantityCounterLoaded(
      value: dummyProducts[index].quantity,
      productId: productId,
    ));
    // emit(CartLoaded(
    //     cartItems: dummyProducts
    //         .where((item) => item.isAddedToCart == true)
    //         .toList()));
  }
}
