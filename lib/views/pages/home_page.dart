import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/models/home_carousel_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/views/widgits/category_tab_view.dart';
import 'package:flutter_ecommerce_app/views/widgits/home_tab_view.dart';

import '../../models/product_item_model.dart';
import '../widgits/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
   late final TabController _tabController;
   
   @override
  void initState() {
    _tabController=TabController(length: 2,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
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
              
              TabBar(
                controller: _tabController,
                unselectedLabelColor: AppColors.grey,
                tabs:[
                 Tab(
                  text: 'Home',
                 ),

                  Tab(
                  text: 'Category',
                 ),
              ]        
              ),

              const SizedBox(height: 24,),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children:[
                    HomeTabView(),
                    CategoryTabView(),
                  ] 
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}