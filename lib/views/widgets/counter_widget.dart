import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_item_model.dart';

class CounterWidget extends StatelessWidget {
  final dynamic cubit;
  final int value;
  final ProductItemModel productItem;
  const CounterWidget({super.key, required this.cubit, required this.value, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(onPressed: ()=>cubit.decrement(productItem.id), 
          icon: Icon(Icons.remove)),
          Text('$value'),
          IconButton(onPressed: ()=>cubit.increment(productItem.id), 
          icon: Icon(Icons.add)),
        ]
        ),
      );
  }
}
