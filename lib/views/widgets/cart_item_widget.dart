import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/add_to_cart_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/cart_cubit/cart_cubit.dart';

import 'counter_widget.dart';

class CartItemWidget extends StatelessWidget {
  final AddToCartModel addToCartItem;
  const CartItemWidget({super.key, required this.addToCartItem});

  @override
  Widget build(BuildContext context) {
    final cartCubit=BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: addToCartItem.product.imgUrl,
                      fit: BoxFit.contain,
                      height: 120,
                      width: 200,
                    ),
                  ),
                ),
                PositionedDirectional(
                    end: 8,
                    top: 8,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.red.withOpacity(0.3),
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: (){},//=>cartCubit.removeFromCart(addToCartItem.id),
                          icon: Icon(Icons.delete_outline),
                          color: AppColors.red,
                        ))),
                PositionedDirectional(
                    start: 8,
                    bottom: 8,
                    child: BlocBuilder<CartCubit, CartState>(
                      bloc:cartCubit,
                      buildWhen: (previous,current)=>(current is QuantityCounterLoaded && current.productId==addToCartItem.id)||current is CartLoaded,
                      builder: (context, state) {
                        if(state is QuantityCounterLoaded){
                          return CounterWidget(
                          cubit:BlocProvider.of<CartCubit>(context),
                          value: state.value,
                          productItem: addToCartItem.product,
                        );
                        }else if(state is CartLoaded){
                          return CounterWidget(
                          cubit:BlocProvider.of<CartCubit>(context),
                          value: state.cartItems.firstWhere((element) => element.id==addToCartItem.id).quantity,
                          productItem: addToCartItem.product,
                        );
                        } else{
                          return const SizedBox.shrink();
                        }
                        
                      },
                    )),
              ],
            ),
          ),

          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addToCartItem.product.name,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                  ),
                  if(addToCartItem.size!=null)
                    Text.rich(
                    TextSpan(
                      text: "Size: ",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.grey),
                      children:[
                         TextSpan(
                          text: "${addToCartItem.size?.name}",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600
                          ),
                       
                        ),
                      ],
                        
                       ),
                  )
                ],
              ),
              Text(
                '\$${addToCartItem.product.price*addToCartItem.quantity}',
                 style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600
                 ),
              )

            ],
          )

        ],
      ),
    );
  }
}
