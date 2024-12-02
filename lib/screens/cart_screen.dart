import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_cart/app_events.dart';
import '../bloc/bloc_cart/app_states.dart';
import '../bloc/bloc_cart/cart_bloc.dart';
import '../configuration/theme.dart';
import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_theme.backgroundwhite,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: App_theme.backgroundwhite,
        centerTitle: false,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: App_theme.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, AppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: App_theme.primary,
              ),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is EmptyState) {
            return const Center(
              child: Text('No items in the cart'),
            );
          } else if (state is LoadedState) {
            List<MealModel> cartItemsList = state.data as List<MealModel>;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItemsList[index].name,
                          style: const TextStyle(
                            color: App_theme.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${cartItemsList[index].price} AED',
                          style: const TextStyle(
                            color: App_theme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 124,
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: App_theme.borderGray),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context).add(RemoveEvent(cartItemsList[index].id));
                                },
                                icon: const Icon(Icons.remove,size: 16,),

                              ),
                              Text('${cartItemsList[index].quantity}'),
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context).add(AddEvent(cartItemsList[index].id));
                                },
                                icon: const Icon(Icons.add,size: 16,),

                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/cart_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => const Divider(
                color: App_theme.borderGray,
                thickness: 1,
                height: 32,
              ),
              itemCount: cartItemsList.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}


