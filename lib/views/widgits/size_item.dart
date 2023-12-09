import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class sizeItem extends StatelessWidget {
  const sizeItem({super.key, required this.label, this.isActive=false, required this.onTap});
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(8),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isActive? Colors.deepPurple:  AppColors.grey[200],
        borderRadius: BorderRadius.circular(18),
      ),
      child:InkWell(
        onTap: onTap,
        child:Text(label,
            style: TextStyle(
               color: isActive? Colors.white: Colors.black,
               fontSize: 16,
            )),
      )
    );
  }
}