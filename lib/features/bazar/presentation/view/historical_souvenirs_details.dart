import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/widgets/custom_add_to_cart.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/home/presentation/widgets/detailed_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SouvenirDescriptionScreen extends StatelessWidget {
  final List souvenirDetails;
  final int index;

  const SouvenirDescriptionScreen({
    Key? key,
    required this.souvenirDetails,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDetailedAppbar(),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: souvenirDetails[index].image,
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .6,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              souvenirDetails[index].name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Material:', souvenirDetails[index].material),
                  _buildDetailRow(
                      'Significance:', souvenirDetails[index].significance),
                  _buildDetailRow(
                      'Price Range:', souvenirDetails[index].price_range),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    souvenirDetails[index].description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<BazarBloc, BazarState>(
              builder: (context, state) {
                return state is LoadingAddToCart
                    ? const Center(child: CircularProgressIndicator())
                    : CustomAddtocartButton(
                        onPress: () {
                          context.read<BazarBloc>().add(AddToCartEvent(
                                souvenirDetails[index].name,
                                souvenirDetails[index].price_range,
                                souvenirDetails[index].image,
                              ));
                        },
                        text: 'Add To Cart',
                      );
              },
              listener: (BuildContext context, BazarState state) {
                state is SuccessAddToCart
                    ? ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)))
                    : null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
