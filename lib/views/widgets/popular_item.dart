import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.popularList,
  });

  final List <ProductItemModel> popularList;

  @override
  Widget build(BuildContext context) {
 
    return  
    Row(
        //   children: [
        //     Container(
        //       width: MediaQuery.of(context).size.width * 0.2,
        //       height: MediaQuery.of(context).size.width * 0.2,
        //       clipBehavior: Clip.antiAliasWithSaveLayer,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       child: Image.network(
        //         popularList[1].imgUrl,
        //         width: double.infinity,
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     const SizedBox(width: 15),
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             "newsItemcategory",
        //             style: const TextStyle(
        //               fontSize: 18,
        //               color: Colors.black,
        //               fontWeight: FontWeight.bold
        //             ),
        //           ),
        //           const SizedBox(height: 10),
        //           Text(
        //             "(newsItem.title)",
        //             style: const TextStyle(
        //               fontSize: 14,
        //               color: Colors.black38,
        //               fontWeight: FontWeight.w600,
        //             ),
        //             maxLines: 2,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //           const SizedBox(height: 20),
              
        //         ],
        //       ),
        //     ),

        //     Container(
        //       width: MediaQuery.of(context).size.width * 0.11,
        //       height: MediaQuery.of(context).size.width * 0.11,
        //       clipBehavior: Clip.antiAliasWithSaveLayer,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //       child: Text(
        //         "hfhhf"
        //       )
        //     ),
        //   ],
         );
          }
}
