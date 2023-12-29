import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_item._model.dart';
import 'package:flutter_ecommerce_app/view_models/category_cubit/category_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/category_item.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubitCubit, CategoryCubitState>(
    bloc: BlocProvider.of<CategoryCubitCubit>(context),
    
    builder: (context, state) {
      if(state is CategoryLoading){
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }else if(state is CategoryError){
        return  Center(
          child: Text(state.message),
        );
      }else if(state is CategoryLoaded){
      return SingleChildScrollView(
        child: Column(
            children: [
              GridView.builder(
                itemCount: state.categories.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  childAspectRatio: (1 / .36),
                ),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: CategoryItem(categoryItem: state.categories[index])),
              )
            ],
          ),
      );
      }
       else {
        return const SizedBox.shrink();
      } 
      
    }
    );
  }
}
