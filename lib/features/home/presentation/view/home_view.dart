import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/widgets/custom_header.dart';
import 'package:dalel/features/home/data/historicalPeriodsModel.dart';
import 'package:dalel/features/home/presentation/bloc/home_bloc.dart';
import 'package:dalel/features/home/presentation/view/historical_period_view.dart';
import 'package:dalel/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomAppbar(),
          const CustomHeaderText(
            text: 'Historical periods',
          ),
          BlocProvider(
            create: (context) =>
                HomeBloc()..add(GetHistoricalPeriods('Historical periods')),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state is SuccessGetHistoricalPeriods
                    ? HistoricalPeriod(model: state.data)
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          const CustomHeaderText(
            text: 'Historical Characters',
          ),
          BlocProvider(
            create: (context) =>
                HomeBloc()..add(GetHistoricalPeriods('Historical Characters')),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state is SuccessGetHistoricalPeriods
                    ? HistoricalCharacters(model: state.data)
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          const CustomHeaderText(
            text: 'Historical Souvenirs',
          ),
          const HistoricalSouvenirs()
        ],
      ),
    );
  }
}

/*this all widgets used in above*/

class HistoricalPeriod extends StatelessWidget {
  final List<HistoricalPeriodsModel> model;
  const HistoricalPeriod({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return HistoricalPeriodScreen(
                      data: model,
                      index: i,
                    );
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 10,
                            offset: const Offset(0, 7)),
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  height: 100,
                  width: 164,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 62,
                          width: 75,
                          child: Text(
                            model[i].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: AppColors.appColor),
                          )),
                      Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                    model[i].image))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              )
            ],
          );
        },
        itemCount: 2,
      ),
    );
  }
}

class HistoricalCharacters extends StatelessWidget {
  final List<HistoricalPeriodsModel> model;

  const HistoricalCharacters({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        scrollDirection: Axis.horizontal,
        itemCount: model.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return HistoricalPeriodScreen(data: model, index: index);
              }));
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
                          model[index].image,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    model[index].name,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HistoricalSouvenirs extends StatelessWidget {
  const HistoricalSouvenirs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (_, index) {
          return const CustomCategoryListViewItem();
        },
      ),
    );
  }
}

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 7))
          ]),
      child: Column(
        children: [
          Container(
            width: 74,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                image: AssetImage(
                  Assets.imagesFrame3,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 11),
          const Text(
            "Lionheart",
          )
        ],
      ),
    );
  }
}
