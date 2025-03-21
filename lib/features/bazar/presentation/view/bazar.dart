import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/widgets/custom_appbar.dart';
import 'package:dalel/core/widgets/custom_header.dart';
import 'package:dalel/features/bazar/data/historical_books_model.dart';
import 'package:dalel/features/bazar/data/historical_souviners_model.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/bazar/presentation/view/historical_book_details.dart';
import 'package:dalel/features/bazar/presentation/view/historical_souvenirs_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BazarScreen extends StatelessWidget {
  const BazarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(text: 'Bazar'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomHeaderText(text: 'History Books'),
              ),
              const Row(
                children: [
                  Expanded(
                    child: CategoryCard(
                      title: 'Ancient Egypt',
                      imageUrl: Assets.imagesFrame,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CategoryCard(
                      title: 'Islamic Era',
                      imageUrl: Assets.imagesFrame2,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomHeaderText(text: 'History Books'),
              ),
              BlocProvider(
                create: (context) =>
                    BazarBloc()..add(GetHistoricalBooksEvent()),
                child: BlocBuilder<BazarBloc, BazarState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: state is SuccessGetHistoricalBooks
                          ? BooksProductCard(
                              data: state.data,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomHeaderText(text: 'Historical Souvenirs'),
              ),
              BlocProvider(
                create: (context) =>
                    BazarBloc()..add(GetHistoricalSouvinersEvent()),
                child: BlocBuilder<BazarBloc, BazarState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: state is SuccessGetHistoricalSouviners
                          ? SouvinersProductCard(
                              data: state.data,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            right: 10,
            child: CircleAvatar(
                backgroundColor: const Color(0xFFB18573),
                radius: 30,
                child: IconButton(
                  onPressed: () async {},
                  color: Colors.white,
                  icon: const Icon(Icons.shopping_cart),
                )))
      ],
    );
  }
}

/*--------------------------------------------------------------------*/

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
                Image.asset(imageUrl, height: 60, width: 60, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF5A3629),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class BooksProductCard extends StatelessWidget {
  final List<HistoricalBoxModel> data;

  const BooksProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      data: data,
    );
  }
}

class SouvinersProductCard extends StatelessWidget {
  final List<HistoricalSouvinersModel> data;

  const SouvinersProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      data: data,
    );
  }
}

class CustomListView extends StatelessWidget {
  final List data;
  const CustomListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SizedBox(
        height: 133,
        child: ListView.separated(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                data is List<HistoricalBoxModel>
                    ? Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return BookDescriptionScreen(
                          bookDetails: data,
                          index: index,
                        );
                      }))
                    : data is List<HistoricalSouvinersModel>
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (c) {
                            return SouvenirDescriptionScreen(
                              souvenirDetails: data,
                              index: index,
                            );
                          }))
                        : null;
              },
              child: Container(
                width: 74,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 7))
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: 74,
                      height: 96,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            data[index].image,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      data[index].name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
