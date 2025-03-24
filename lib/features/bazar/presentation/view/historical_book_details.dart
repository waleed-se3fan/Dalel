import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/widgets/custom_add_to_cart.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/bazar/presentation/view/historical_souvenirs_details.dart';
import 'package:dalel/features/home/presentation/widgets/detailed_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDescriptionScreen extends StatelessWidget {
  final List bookDetails;
  final int index;

  const BookDescriptionScreen({
    Key? key,
    required this.bookDetails,
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
            const SizedBox(
              height: 25,
            ),
            const CustomDetailedAppbar(),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .6,
                  fit: BoxFit.fill,
                  imageUrl: bookDetails[index].image,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              bookDetails[index].name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'by : ${bookDetails[index].creator}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 24),
                const SizedBox(width: 4),
                Text(
                  bookDetails[index].rating.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.menu_book, color: Colors.brown, size: 24),
                const SizedBox(width: 4),
                Text(
                  '${bookDetails[index].pages} pages',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
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
                  Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bookDetails[index].summary,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Published on (${bookDetails[index].publishDate})',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<BazarBloc, BazarState>(
              builder: (context, state) {
                return state is LoadingAddToCart
                    ? const Center(child: CircularProgressIndicator())
                    : CustomAddtocartButton(
                        onPress: () {
                          context.read<BazarBloc>().add(AddToCartEvent(
                              bookDetails[index].name,
                              '50 ',
                              bookDetails[index].image));
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
}
