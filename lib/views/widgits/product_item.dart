import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productItem});
  final ProductItemModel productItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                            imageUrl:productItem.imgUrl,
                            fit:BoxFit.fill,
                            placeholder: (context,url)=>const Center(
                              child: CircularProgressIndicator.adaptive(),
                              ),
                              errorWidget: (context,url,error)=> const Icon(Icons.error),
                            ),
              )),
            Positioned(
              top: 8,
              right: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white60,
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.favorite_border),
                  ),
              ),
            ),
          ],
        ),
            const SizedBox(height: 8,),
            Text(
              productItem.name,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
            ),
            
            Text(
              productItem.category,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      //fontWeight: FontWeight.w600,
                      color: Colors.grey
                    ),
            ),
           
            Text(
              '\$${productItem.price}',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
            ),
            
          ],
         
        
      
    );
  }
}