import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_item._model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/shared/widget_extension.dart';
import 'package:flutter_ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgits/category_list.dart';
import 'package:flutter_ecommerce_app/views/widgits/product_item.dart';

import '../widgits/sarch_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<FavoriteCubit>(context).getFavorite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Favorite",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [Icon(Icons.notifications_none)],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SearchBarWidget(),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryList(lable: "All", isSelected: true),
                    ...dummyCategories.map(
                      (e) => CategoryList(lable: e.name, isSelected: false),
                    ),
                  ].addSeparator(const SizedBox(
                    width: 8,
                  )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<FavoriteCubit, FavoriteState>(
               //bloc: BlocProvider.of<FavoriteCubit>(context),
                builder: (context, state) {
                  if(state is favoriteLoadingState){
                    return const CircularProgressIndicator.adaptive();
                  }else if(state is favoriteLoadedState){
                    if(state.products.length==0){
                      return const Center(
                              child:  Text(
                                "Empty Favorite List!",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 142, 141, 141),
                                ),
                              ),
                            );
                    }
                    return GridView.builder(
                    itemCount: state.products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.7 / 1.6),
                        
                    itemBuilder: (context, index) {
                      return ProductItem(productItem: state.products[index]);

                    },
                  );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
