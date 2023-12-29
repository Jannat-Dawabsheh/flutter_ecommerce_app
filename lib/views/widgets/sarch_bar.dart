import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[400]!, width: 1),
      ),
      child: const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Row(
          children: [
            Icon(CupertinoIcons.search),
            SizedBox(width: 8,),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search smething...",
                  border: InputBorder.none,

                ),
            
              ),
            ),
             Icon(PhosphorIcons.sliders_horizontal),
      
          ],
      
      
        ),
      ),
    );
  }
}