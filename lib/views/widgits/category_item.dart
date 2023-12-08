import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/category_item._model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryItem});
  final CategoryItemModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
                   width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade200,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                        imageUrl:categoryItem.imgUrl,
                        fit:BoxFit.fill,
                        placeholder: (context,url)=>const Center(
                          child: CircularProgressIndicator.adaptive(),
                          ),
                          errorWidget: (context,url,error)=> const Icon(Icons.error),
                      )
                  ),
                  Positioned(
                    
                      top: 70,
                      left: int.parse(categoryItem.id).isEven?300:100,
                      child:Column(
                    children: [
                      Text(
                        categoryItem.name,
                        style:TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                        )
                        ),
                      
                      ],
                      ) ,
                    ),
                  
      ],
    );
  }
}


