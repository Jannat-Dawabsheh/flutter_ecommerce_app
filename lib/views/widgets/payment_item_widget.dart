import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/payment_method_model.dart';
import 'package:flutter_ecommerce_app/view_models/payment_cubit/payment_cubit.dart';

import '../../utils/app_colors.dart';

class PaymentItemWidget extends StatelessWidget {
  final PaymentMethodModel? paymentMethod;
  final VoidCallback? additiononTap;
  const PaymentItemWidget({super.key, this.paymentMethod, this.additiononTap});

  @override
  Widget build(BuildContext context) {
    final cubit=BlocProvider.of<PaymentCubit>(context);
    return Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: ListTile(
                      onTap: additiononTap!=null&&paymentMethod==null?additiononTap:() {
                        cubit.choosePaymentMethod(paymentMethod!.id);
                      },
                    leading:paymentMethod==null?const Icon(Icons.add): ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: paymentMethod!.imgUrl,
                        width: 100,
                        height: 100,
                        ),
                    ),
                    title: Text(paymentMethod!=null? paymentMethod!.name:'Add Payment Method', style: Theme.of(context).textTheme.titleMedium,),
                    subtitle: paymentMethod!=null? Text(paymentMethod!.cardNumber, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.grey), ):null,
                     trailing:paymentMethod!=null?
                     BlocBuilder<PaymentCubit, PaymentState>(
                      bloc:cubit,
                      buildWhen:(previos,current)=>current is PaymentMethodChosen,
                       builder: (context, state) {
                         return Radio<String>(
                            value: paymentMethod!.id, 
                            groupValue: state is PaymentMethodChosen?state.paymentMethodId:null, 
                            onChanged:(value){
                              cubit.choosePaymentMethod(value!);
                              debugPrint(value);
                            }
                              
                            );
                            
                       },
                     ):null , 
                    ),
                  ),
                  ),
              );
  }
}