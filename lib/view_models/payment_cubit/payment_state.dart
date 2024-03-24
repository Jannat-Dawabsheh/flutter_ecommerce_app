part of 'payment_cubit.dart';

sealed class PaymentState {
  const PaymentState();

  get carouselItems => null;
}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState{}
final class PaymentLoaded extends PaymentState{
 //final List<ProductItemModel>cartItems;
 final double total;
 final List<AddToCartModel> cartItems;
 const PaymentLoaded({
  required this.cartItems,
  required this.total,
 });
}

final class PaymentError extends PaymentState{

 final String message;
 const PaymentError({
  required this.message,
 });
}

final class PaymentMethodChosen extends PaymentState{

 final String paymentMethodId;
 final PaymentMethodModel? chosedCard;
 const PaymentMethodChosen(this.chosedCard, {
  required this.paymentMethodId,
 });
}






