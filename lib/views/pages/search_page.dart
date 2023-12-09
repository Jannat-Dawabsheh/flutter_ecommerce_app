import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/category_item._model.dart';
import 'package:flutter_ecommerce_app/views/widgits/popular_item.dart';

import '../../models/product_item_model.dart';

// the Data is still dummy //TODo: use cubit....................
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title:  TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 3,), 
                borderRadius: BorderRadius.circular(20.0),
             ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Last Search',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Clear All'),
                )
              ],
            ),
            const SizedBox(height: 20,),
            IntrinsicWidth(
              child: IntrinsicHeight(
                child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          dummyProducts[1].name,
                          style: TextStyle(fontSize:14,color: Colors.grey),
                        ),
                        const SizedBox(width: 2,),
                        Icon(Icons.close, color: Colors.grey, size: 18,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Popular Search',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                 const SizedBox(height: 16),
              Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    for(int i=0;i<dummyProducts.length;i++)
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        elevation: 0,
                        shadowColor: Colors.white,
                       child:Padding(
                         padding: const EdgeInsets.all(5),
                         child:
                         Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.2,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            
                          ),
                          child: Image.network(
                            dummyProducts[i].imgUrl,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dummyProducts[i].name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "1.1k Search today",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                                    
                            ],
                            
                          ),
                        ),
                      IntrinsicHeight(
                        child: IntrinsicWidth(
                          child: Container(
                  
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    //color: Colors.redAccent.withOpacity(0.4),
                                     color: Colors.orangeAccent.withOpacity(0.4),
                                      // color: Colors.greenAccent.withOpacity(0.4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                    child: Text(
                                      //"Hot",
                                      //style: TextStyle( fontSize: 16, fontWeight:FontWeight.w600 ,color: Colors.red),
                                      "New",
                                      style: TextStyle( fontSize: 16, fontWeight:FontWeight.w600 ,color: Colors.orange),
                                      // "Popular",
                                      // style: TextStyle( fontSize: 16, fontWeight:FontWeight.w600 ,color: Colors.green),
                                    ),
                                  ),
                                  ),
                        ),
                      ),
                      ],
                      
                     ),
                       )
                      )
                    )
                  ],
                ),
              ),
                      ), 
              
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}