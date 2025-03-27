import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/database/paymob.dart';
import 'package:dalel/core/widgets/custom_add_to_cart.dart';
import 'package:dalel/core/widgets/custom_header.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout Screen',
          style: TextStyle(color: Colors.brown, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70, right: 6, left: 6),
            child: ListView(
              children: const [
                CustomHeaderText(text: 'Delivery Address'),
                DeliveryAddressWidget(),
                CustomHeaderText(text: 'Selected Product'),
                SizedBox(height: 16),
                SelectedProductWidget(),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .71),
                child: TotalPaymentWidget(),
              )),
        ],
      ),
    );
  }
}

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.home, color: Colors.brown),
                    const SizedBox(width: 8),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.brown.shade300),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  state is SuccessGetProfile
                      ? '${state.model.firstName} ${state.model.lastName}'
                      : '..........',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  state is SuccessGetProfile
                      ? state.model.location
                      : 'Pangandaran Brick Street No. 690\n445434 Yogya, Central Java',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SelectedProductWidget extends StatelessWidget {
  const SelectedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BazarBloc, BazarState>(
      builder: (context, state) {
        return state is SuccessGetFromCart
            ? SizedBox(
                height: MediaQuery.of(context).size.height * .6,
                child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (c, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          state.data[i].image),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.data[i].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text(state.data[i].price,
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : const Center(
                child: Text('No Items'),
              );
      },
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        children: [
          _buildPaymentMethod('My Credit Card', true),
          _buildPaymentMethod('My Electric Cash', false),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(String title, bool isSelected) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.brown.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        title: Text(title),
        subtitle: const Text('1231 3212 2221 0910'),
        trailing: Radio(
          value: isSelected,
          groupValue: true,
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class TotalPaymentWidget extends StatelessWidget {
  const TotalPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Payment',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .3,
              ),
              BlocBuilder<BazarBloc, BazarState>(
                builder: (context, state) {
                  return Text(
                    state is SuccessGetFromCart
                        ? '\$${state.totalPrice}'
                        : '\$${BazarBloc().totalPrice.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomAddtocartButton(
              onPress: () async {
                PaymobService().makeOrder(context, 50 * 5000);
              },
              text: 'Confirm Payment')
        ],
      ),
    );
  }
}
