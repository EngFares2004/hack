import 'package:flutter/material.dart';
import 'package:untitled1/configuration/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_discount/discount_bloc.dart';
import '../bloc/bloc_discount/discount_events.dart';
import '../bloc/bloc_discount/discount_states.dart';
import '../widgets/addreesinput.dart';
import '../widgets/delivery_method_selector.dart';

import '../widgets/order_action_buttom.dart';
import '../widgets/order_cart_item.dart';
import '../widgets/selected_branch.dart';
import '../widgets/voucher_text_fieled.dart';


class OrderPage extends StatelessWidget {
  final String? selectedBranch;
  const OrderPage({Key? key, this.selectedBranch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController voucherController = TextEditingController();
    double subtotal = 3000;
    double tax = 10;
    return Scaffold(
      backgroundColor: App_theme.backgroundwhite,
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(color: App_theme.black,fontWeight: FontWeight.w500,fontSize: 16)),
        backgroundColor: App_theme.backgroundwhite,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderCartItem(
                title: 'Cat Food',
                price: '99 EGP',
                imagePath: 'assets/images/Catfood.png',
              ),
              const SizedBox(height: 16),
              const OrderCartItem(
                title: 'Chicken Cacciatore',
                price: '59 EGP',
                imagePath: 'assets/images/cats toy.png',
              ),
              const SizedBox(height: 16),
              const Text(
                "Voucher",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 8),
              BlocProvider(
                create: (context) => DiscountBloc(subtotal: subtotal, tax: tax),
                child: BlocBuilder<DiscountBloc, DiscountState>(
                  builder: (context, state) {
                    double totalPrice = subtotal + tax;
                    if (state is DiscountApplied) {
                      totalPrice = state.totalPrice.toDouble();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VoucherTextField(
                          voucherController: voucherController,
                          hintText: 'Enter the voucher',
                          prefixIconPath: 'assets/icons/voucher.svg',
                          suffixIcon: state is DiscountLoading
                              ? Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  height: 40,
                                  child: const CircularProgressIndicator(
                                    color: App_theme.primary,
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {
                                    final voucherCode = voucherController.text;
                                    BlocProvider.of<DiscountBloc>(context)
                                        .add(ApplyDiscountEvent(voucherCode));
                                  },
                                  child: const Text('Apply', style: TextStyle(color: App_theme.primary, fontWeight: FontWeight.w600, fontSize: 14,),),),),
                        if (state is DiscountApplied)
                          const Text('Voucher applied successfully!', style: TextStyle(color:App_theme.primary),),
                        const SizedBox(height: 8),
                        if (state is DiscountError)
                          Text(state.error, style: const TextStyle(color: App_theme.error),),
                        const SizedBox(height: 16),
                        const Text('Choose the method', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                        const SizedBox(height: 8),
                        const DeliveryMethodSelector(),
                        const SizedBox(height: 16),
                        const Text('Select a governorate', style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 16),
                        const SelectedGovernorate(),
                        const SizedBox(height: 16),
                        const AddressInput(),
                        const SizedBox(height: 8),
                        const SizedBox(height: 24),
                        const Text('Order Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        const SizedBox(height: 16),
                        const Divider(thickness: 1),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal', style: TextStyle(fontSize: 14)),
                            Text('3000 AED', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tax', style: TextStyle(fontSize: 14)),
                            Text('10 AED', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(thickness: 1),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                            Text('${totalPrice.toInt()} AED', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: App_theme.primary,),),],),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            OrderActionButton(
                              text: 'Add More Items',
                              color: App_theme.primary.withOpacity(0.3),
                              onPressed: () {},
                              textColor: App_theme.primary,
                            ),
                            const SizedBox(width: 16),
                            OrderActionButton(
                              text: 'Checkout',
                              color: App_theme.primary,
                              onPressed: () {},
                              textColor: App_theme.backgroundwhite,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
