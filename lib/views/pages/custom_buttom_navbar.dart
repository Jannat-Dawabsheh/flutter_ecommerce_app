import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/home_cubit/home_cubit_cubit.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_routes.dart';
import 'cart_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    _controller = PersistentTabController();
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) {
          final cubit = HomeCubitCubit();
          cubit.getHomeData();
          return cubit;
        },
        child: const HomePage(),
      ),
       BlocProvider(
        create: (context){
          final cubit =CartCubit();
          cubit.getCartItems();
          return cubit;
        },
        child: CartPage(),
      ),
      const FavoritePage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "home",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_border),
        title: "Favorite",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(
                "https://tricky-photoshop.com/wp-content/uploads/2017/08/final-1.png"),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Jonathan',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Let\'s go shopping',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          if (_currentIndex == 0) ...[
            IconButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    AppRoutes.SearchPage,
                  );
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined)),
          ],
          if (_currentIndex == 1)
            TextButton.icon(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                  AppRoutes.myOrders,
                );
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text("My Orders"),
            ),
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea:
            true, // Default is true. // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}
