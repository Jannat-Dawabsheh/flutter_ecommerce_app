import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/models/size_model.dart';
import 'package:flutter_ecommerce_app/shared/widget_extension.dart';
import 'package:flutter_ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/product_cubit/product_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/size_item.dart';

import '../widgets/fav_icon.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productItem});
  final ProductItemModel productItem;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<FavoriteCubit>(context).getFavorite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.watch<ProductCubit>();
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Detail Product"),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          actions: [
            // BlocBuilder<FavoriteCubit, FavoriteState>(
            //   builder: (context, state) {
            //     final isfavorite=BlocProvider.of<FavoriteCubit>(context).favoratieProducts[widget.productItem.id]??false;
            //      if(state is favoriteLoadedState){
            //       print("lllllist is ${state.products.length}");
            //     }
            //     print("the list is ${BlocProvider.of<FavoriteCubit>(context).favoratieProducts} is fav = $isfavorite");
            //     return IconButton(
            //       onPressed: () {
            //          if(isfavorite){
            //               BlocProvider.of<FavoriteCubit>(context).deleteFavorite(widget.productItem.id);
            //             }else{
            //              BlocProvider.of<FavoriteCubit>(context).addFavorite(widget.productItem.id);
            //             }
            //       },
            //       icon: Icon(widget.productItem.isFavorite
            //           ? Icons.favorite
            //           : Icons.favorite_border),
            //       color: Colors.deepPurple,
            //     );
            //   },
            // ),
             FavIcon( productItem: widget.productItem,),
             const SizedBox(
              width: 8,
            ),
          ],
        ),
        body: SafeArea(child:
            BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image.network(
                            widget.productItem.imgUrl,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.productItem.name,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "4.8",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "(320 Review)",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: cubit.decrement,
                                              icon: const Icon(Icons.remove)),
                                          Text("${state.quantity}"),
                                          IconButton(
                                            onPressed: cubit.increment,
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "Avilable in stok",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 32),
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Color",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SingleChildScrollView(
                                    child: Row(
                                        children: List.generate(
                                            itemsSize.length,
                                            (index) => sizeItem(
                                                  label: itemsSize[index].label,
                                                  isActive: state.size == index,
                                                  onTap: () {
                                                    cubit.setSize(index);
                                                  },
                                                )).addSeparator(SizedBox(
                                      width: context.screenWidth * 0.03,
                                    ))),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Container(
                              //alignment: AlignmentDirectional.centerStart,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Description",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.productItem.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height > 800 ? size.height * 0.1 : 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: size.width > 800 ? 24.0 : 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: size.width > 800 ? 3 : 2,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                          children: [
                            const TextSpan(text: "\$"),
                            TextSpan(
                                text: (widget.productItem.price * state.quantity)
                                    .toStringAsFixed(2),
                                style: const TextStyle(
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: size.height * 0.05,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                )),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.card_travel,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Checkout"),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        })));
  }
}
