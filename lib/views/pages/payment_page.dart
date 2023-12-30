import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/address_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter_ecommerce_app/views/pages/address_page.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item_payment_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        bloc:BlocProvider.of<PaymentCubit>(context),
        builder: (context, state) {
          if(state is PaymentLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(state is PaymentError){
          return  Center(
            child: Text(state.message),
          );
        }else if(state is PaymentLoaded){
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                children: [
                  buildInlineHeadlines(
                      context: context, title: 'Address', onTap: () {}),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: ()=>Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.address),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: ModalRoute.of(context)?.settings.arguments==null?AppColors.grey.withOpacity(0.2):Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ModalRoute.of(context)?.settings.arguments==null?
                      Center(
                        child: Text('Add Address'),
                      ):
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16), // Image border
                            child: SizedBox.fromSize(
                              child: Image.network((ModalRoute.of(context)?.settings.arguments as AddressItemModel).imgUrl, fit: BoxFit.cover, width: 150,),
                            ),
                          ),
                          const SizedBox(width: 16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text((ModalRoute.of(context)?.settings.arguments as AddressItemModel).city,  
                              style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8,),
                              Text((ModalRoute.of(context)?.settings.arguments as AddressItemModel).fullAddress,
                                 style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: AppColors.grey),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  buildInlineHeadlines(
                      context: context, title: 'Products', productNumbers: state.cartItems.length),
                  const SizedBox(height: 8,),
                  ListView.builder(
                    itemCount:state.cartItems.length ,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder:(context,index){
                      final item=state.cartItems[index];
                      return ProductItemPaymentWidget(item: item,);
                        } ),
                  const SizedBox(height: 16,),
                  buildInlineHeadlines(context: context, title: 'Payment Methods'),
                  const SizedBox(height: 16,),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text('Add Payment Method'),
                        ),
                      ),
                    ),
                  ),
                 const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount",
                        style:Theme.of(context).textTheme.labelLarge!.copyWith(color:AppColors.grey),
                      ),
                      Text(
                        "\$${state.total}",
                        style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                    onPressed: (){}, 
                    child: Text("Checkout Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    ),  
                  ),
                ),
                  const SizedBox(height: 32,),


                ],
              ),
            ),
          );
        }else {
          return const SizedBox.shrink();
        }
        },
      ),
    );
  }

  Widget buildInlineHeadlines({
    required BuildContext context,
    required String title,
    int? productNumbers,
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
             style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)
            ),
            if (productNumbers != null)
              Text(
                '($productNumbers)',
               style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)
              ),
          ],
        ),
        if (onTap != null)
          TextButton(
              onPressed: () {},
              child: Text(
                'Edit',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.primary),
              ))
      ],
    );
  }
}
