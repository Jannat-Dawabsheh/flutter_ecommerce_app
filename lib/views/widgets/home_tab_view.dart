import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/home_cubit/home_cubit_cubit.dart';
import 'package:flutter_ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/home_carousel_model.dart';
import '../../models/product_item_model.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubitCubit,HomeCubitState>(
      bloc: BlocProvider.of<HomeCubitCubit>(context),
      builder: (context, state) {
        if(state is HomeLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(state is HomeError){
          return  Center(
            child: Text(state.message),
          );
        }else if(state is HomeLoaded){
        return SingleChildScrollView(
          child: Column(
            children: [
              FlutterCarousel(
                options: CarouselOptions(
                  height: 200.0,
                  showIndicator: true,
                  slideIndicator: CircularWaveSlideIndicator(),
                ),
                items: state.carouselItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: item.imgUrl,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 24,
              ),
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
                    onPressed: () {},
                    child: const Text('See All'),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              GridView.builder(
                itemCount: state.products.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){
                        Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.productDetails, arguments: state.products[index] );
                      },
                      child: ProductItem(productItem: state.products[index])
                      ),
              )
            ],
          ),
        );
        }else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
