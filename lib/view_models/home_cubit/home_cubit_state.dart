part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {
  const HomeCubitState();

  get carouselItems => null;
}

final class HomeCubitInitial extends HomeCubitState {}
final class HomeLoading extends HomeCubitState{}
final class HomeLoaded extends HomeCubitState{

 final List<ProductItemModel>products;
  final List<HomeCarouselModel>carouselItems;
 
 const HomeLoaded({
  required this.products,
  required this.carouselItems,
 });
}

final class HomeError extends HomeCubitState{

 final String message;
 const HomeError({
  required this.message,
 });
}



