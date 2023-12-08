part of 'category_cubit.dart';

@immutable
sealed class CategoryCubitState {
  const CategoryCubitState();
}

final class CategoryCubitInitial extends CategoryCubitState {}
final class CategoryLoading extends CategoryCubitState{}
final class CategoryLoaded extends CategoryCubitState{

 final List<CategoryItemModel>categories;
 
 const CategoryLoaded({
  required this.categories,
 });
}

final class CategoryError extends CategoryCubitState{

 final String message;
 const CategoryError({
  required this.message,
 });
}



