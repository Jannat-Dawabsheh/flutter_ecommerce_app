import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_item_model.dart';
import '../../view_models/favorite_cubit/favorite_cubit.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key, required this.productItem});
    final ProductItemModel productItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isfavorite=BlocProvider.of<FavoriteCubit>(context).favoratieProducts[productItem.id]??false;             
        return IconButton(
          onPressed: () {
            if (isfavorite) {
              BlocProvider.of<FavoriteCubit>(context)
                  .deleteFavorite(productItem.id);
            } else {
              BlocProvider.of<FavoriteCubit>(context)
                  .addFavorite(productItem.id);
            }
          },
          icon: Icon(
            isfavorite ? Icons.favorite : Icons.favorite_border,
            color: isfavorite ? Colors.red : null,
          ),
        );
      },
    );
  }
}
