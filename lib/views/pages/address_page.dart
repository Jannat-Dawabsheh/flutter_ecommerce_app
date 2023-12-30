import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/address_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item_payment_widget.dart';

import '../../utils/app_routes.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Address'),
          centerTitle: true,
        ),
        body: BlocBuilder<AddressCubit, AddressState>(
          bloc:BlocProvider.of<AddressCubit>(context),
          builder: (context, state) {
             if(state is AddressLoadingState){
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            else if(state is AddressLoadedState){
             
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Choose your location',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          'Let\'s find your unforgettable event. Choose a location below to get started',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[500]!, width: 2),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search Location...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.my_location_outlined,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'Select Location',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: addressList.length,
                      itemBuilder: (context, index) {
                         final isSelected=(index ==int.parse(state.item.id)-1);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: isSelected?AppColors.primary: AppColors.grey),
                            ),
                            child: ListTile(
                              onTap: () {
                                 BlocProvider.of<AddressCubit>(context)
                                   .setAddress(addressList[index].id);
                              },
                              title: Text(
                                addressList[index].city,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                addressList[index].fullAddress,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: AppColors.grey),
                              ),
                              trailing: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.red,
                                  border: Border.all(
                                      color: isSelected?AppColors.primary:AppColors.grey, width: 2),
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: CachedNetworkImageProvider(
                                    addressList[index].imgUrl,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                        
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: ()=> Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.payment, arguments: state.item ),
                          child: Text("Confirm"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            );
            }else {
          return const SizedBox.shrink();
        }
            }
        ));
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
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (productNumbers != null)
              Text(
                '($productNumbers)',
                style: Theme.of(context).textTheme.headlineSmall,
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
