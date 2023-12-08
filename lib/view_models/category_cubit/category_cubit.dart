import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/category_item._model.dart';

part 'category_state.dart';

class CategoryCubitCubit extends Cubit<CategoryCubitState> {
  CategoryCubitCubit() : super(CategoryCubitInitial());

    void getCategoryData(){
    emit(CategoryLoading());
    Future.delayed(const Duration(seconds: 2),(){
       emit(
        CategoryLoaded(
           categories: dummyCategories,
          )
       );
    });
  }
}


