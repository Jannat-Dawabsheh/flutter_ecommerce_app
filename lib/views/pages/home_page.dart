import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/models/home_carousel_model.dart';

import '../../models/product_item_model.dart';
import '../widgits/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("https://tricky-photoshop.com/wp-content/uploads/2017/08/final-1.png"),
                      ),
                      const SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Jonathan',
                            style: Theme.of(context)
                            .textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),
                          ),

                           Text(
                            'Let\'s go shopping',
                            style: Theme.of(context)
                            .textTheme.labelMedium!.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                     
                    ],
                  ),

                   Row(children: [
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.search)),

                            IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.notifications_none_outlined)),
                        ],
                        ),
                  ],
                ),
                const SizedBox(height: 24,),
                FlutterCarousel(
                    options: CarouselOptions(
                      height: 200.0, 
                      showIndicator: true,
                      slideIndicator:  CircularWaveSlideIndicator(),
                    ),
                    items: dummyCarousel.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(right:16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl:item.imgUrl,
                            fit:BoxFit.fill,
                            placeholder: (context,url)=>const Center(
                              child: CircularProgressIndicator.adaptive(),
                              ),
                              errorWidget: (context,url,error)=> const Icon(Icons.error),
                            ),
                          ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'New Arrivals',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: (){}, 
                      child: Text('See All'),
                      )
                  ],
                ),
                const SizedBox(height: 8,),
                GridView.builder(
                  itemCount: dummyProducts.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8
                    ), 
                  itemBuilder: (context,index)=>ProductItem(productItem:dummyProducts[index]),
                  )
                
              ],
            ),
          ),
        ),
      )
    );
  }
}