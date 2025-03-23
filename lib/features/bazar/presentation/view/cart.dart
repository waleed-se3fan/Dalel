import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/bazar/presentation/view/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BazarBloc, BazarState>(
        builder: (context, state) {
          return state is SuccessGetFromCart
              ? state.data.isEmpty
                  ? const Center(
                      child: Text('Cart is Empty'),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios_new,
                                    color: Colors.brown)),
                            const Text(
                              'My Cart',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.brown),
                            ),
                            const Spacer(),
                            BlocBuilder<BazarBloc, BazarState>(
                              builder: (context, state) {
                                return context
                                        .read<BazarBloc>()
                                        .checkList
                                        .isEmpty
                                    ? Container()
                                    : IconButton(
                                        onPressed: () {
                                          context
                                              .read<BazarBloc>()
                                              .deleteFromCart();
                                        },
                                        icon: const Icon(Icons.delete,
                                            color: Colors.brown),
                                      );
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .7,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      BlocBuilder<BazarBloc, BazarState>(
                                        builder: (context, state) {
                                          final bool x = context
                                              .read<BazarBloc>()
                                              .checkList
                                              .contains(index);

                                          return Checkbox(
                                            value: x,
                                            onChanged: (value) {
                                              context.read<BazarBloc>().add(
                                                  CheckBoxEvent(index, value!));
                                            },
                                            activeColor: Colors.brown,
                                          );
                                        },
                                      ),
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  state.data[index].image),
                                              fit: BoxFit.fill),
                                          // color: Colors.brown.shade100,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.data[index].name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.brown,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              state.data[index].price,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.brown,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, -4),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Payment',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '\$',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (c) {
                                    return const CheckoutScreen();
                                  }));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Checkout Now',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
              : state is LoadingGetFromCart
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const Center(
                      child: Text('Add items To cartg'),
                    );
        },
      ),
    );
  }
}
