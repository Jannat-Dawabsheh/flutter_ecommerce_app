import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.lable, required this.isSelected});
  final String lable;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(
        lable,
      ),
      labelStyle:TextStyle(
          fontSize: 16,
          color: isSelected?Colors.white:Colors.black,
        ), 
      selected: isSelected,
      showCheckmark: false,
       selectedColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
       // side: BorderSide(color: Colors.red),
      ),
      
    );
  }
}