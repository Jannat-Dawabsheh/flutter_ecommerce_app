import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/pages/custom_buttom_navbar.dart';
import 'package:flutter_ecommerce_app/views/pages/home_page.dart';
import 'package:flutter_ecommerce_app/views/pages/product_details_page.dart';

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.productDetails:
      final ProductItemModel productDetailsArguments=settings.arguments as ProductItemModel;
      return MaterialPageRoute(
        builder: (_)=> ProductDetailsPage(productItem: productDetailsArguments),
        settings: settings,
        );

      case AppRoutes.home:
      return MaterialPageRoute(
        builder: (_)=>const CustomBottomNavbar(),
        settings: settings,
        );

        default:
         return MaterialPageRoute(
        builder: (_)=>const Scaffold(
          body: Center(
            child: Text('Error Page!'),
          ),
        ),
        settings: settings,
        );
    }
  }
}