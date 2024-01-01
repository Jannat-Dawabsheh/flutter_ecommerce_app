import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/product_cubit/product_cubit.dart';
import 'package:flutter_ecommerce_app/views/pages/address_page.dart';
import 'package:flutter_ecommerce_app/views/pages/crerate_account_page.dart';
import 'package:flutter_ecommerce_app/views/pages/custom_buttom_navbar.dart';
import 'package:flutter_ecommerce_app/views/pages/home_page.dart';
import 'package:flutter_ecommerce_app/views/pages/login_page.dart';
import 'package:flutter_ecommerce_app/views/pages/payment_page.dart';
import 'package:flutter_ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter_ecommerce_app/views/pages/search_page.dart';

import '../views/pages/my_orders_page.dart';

/*

MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlocA(),
          ),
          BlocProvider(
            create: (context) => BlocB(),
          ),
          BlocProvider(create: (context) => BlocC())
        ],
        child: const HomeScreen(),
      );
*/
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final ProductItemModel productDetailsArguments =
            settings.arguments as ProductItemModel;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FavoriteCubit(),
              ),
              BlocProvider(
                create: (context) => ProductCubit(),
              ),
            ],
            child: ProductDetailsPage(productItem: productDetailsArguments),
          ),
          settings: settings,
        );
      case AppRoutes.SearchPage:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
          settings: settings,
        );
      case AppRoutes.myOrders:
        return MaterialPageRoute(
          builder: (_) => MyOrdersPage(),
          settings: settings,
        );
      case AppRoutes.payment:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = PaymentCubit();
              cubit.getPaymentViewData();
              return cubit;
            },
            child: const PaymentPage(),
          ),
          settings: settings,
        );

      case AppRoutes.address:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = AddressCubit();
              cubit.getAddressList();
              return cubit;
            },
            child: AddressPage(),
          ),
          settings: settings,
        );
        case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

        case AppRoutes.createAccountPage:
        return MaterialPageRoute(
          builder: (_) => const CreateAccountPage(),
          settings: settings,
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FavoriteCubit(),
            child: CustomBottomNavbar(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
