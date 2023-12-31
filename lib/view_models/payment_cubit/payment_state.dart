part of 'payment_cubit.dart';

sealed class PaymentState {
  const PaymentState();

  get carouselItems => null;
}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState{}
final class PaymentLoaded extends PaymentState{
 final List<ProductItemModel>cartItems;
 final double total;
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
 const PaymentMethodChosen({
  required this.paymentMethodId,
 });
}






