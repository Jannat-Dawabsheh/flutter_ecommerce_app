import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/payment_method_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/payment_item_widget.dart';

class PaymentModelBottomSheet extends StatelessWidget {
  const PaymentModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      bloc:BlocProvider.of<PaymentCubit>(context),
      builder: (context, state) {
        return SizedBox(
          height: 500,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: savedCards.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PaymentItemWidget(
                        paymentMethod: savedCards[index],
                      );
                    }),
                PaymentItemWidget(
                  additiononTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.addPaymentCard);
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.pop(context, state is PaymentMethodChosen?state.chosedCard:null);
                    debugPrint( state is PaymentMethodChosen?state.chosedCard?.cardNumber:'null');
                      //   Navigator.of(context, rootNavigator: true).pushNamed(
                      // AppRoutes.payment,arguments: state is PaymentMethodChosen?state.chosedCard:null,
                    },
                    child: Text("Confirm Payment",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
