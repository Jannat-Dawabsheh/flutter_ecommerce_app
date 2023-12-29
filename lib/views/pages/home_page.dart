import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/models/home_carousel_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/category_cubit/category_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/category_tab_view.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_tab_view.dart';

import '../../models/product_item_model.dart';
import '../../utils/app_routes.dart';
import '../widgets/product_item.dart';

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
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 8,),
            TabBar(
              controller: _tabController,
              unselectedLabelColor: AppColors.grey,
              tabs:const [
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
                   BlocProvider(
                     create: (context) {
                    final cubit=CategoryCubitCubit();
                    cubit.getCategoryData();
                    return cubit;
                  },
                  child: const CategoryTabView(),
                ),
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}