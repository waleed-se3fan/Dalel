import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/widgets/custom_header.dart';
import 'package:dalel/features/home/data/historicalPeriodsModel.dart';
import 'package:dalel/features/home/data/warsModel.dart';
import 'package:dalel/features/home/presentation/bloc/home_bloc.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HistoricalPeriodScreen extends StatelessWidget {
  final List<HistoricalPeriodsModel> data;
  final int index;
  const HistoricalPeriodScreen(
      {super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            const CustomAppbar(),
            const SizedBox(
              height: 12,
            ),
            PeriodDetailsSection(
                periodName: data[index].name,
                description: data[index].summary,
                imageUrl: data[index].image),
            CustomHeaderText(text: '${data[index].name} Wars'),
            const SizedBox(
              height: 12,
            ),
            PeriodWars(war: data[index].wars),
            const SizedBox(
              height: 12,
            ),
            const CustomHeaderText(text: 'Recommendations'),
            const SizedBox(
              height: 12,
            ),
            BlocProvider(
              create: (context) => HomeBloc()
                ..add(GetHistoricalPeriods('Historical Characters')),
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
          ],
        ),
      ),
    );
  }
}
/*this all widgets used in above screen*/

class PeriodDetailsSection extends StatelessWidget {
  const PeriodDetailsSection(
      {super.key,
      required this.periodName,
      required this.description,
      required this.imageUrl});
  final String periodName;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(text: "About $periodName"),
            const SizedBox(width: 7),
            SvgPicture.asset(Assets.imagesDetails1),
          ],
        ),
        const SizedBox(height: 47),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -24, child: SvgPicture.asset(Assets.imagesDetails2)),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 220,
                    child: Text(
                      description,
                      maxLines: 13,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.6,
              height: 240,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl),
                        fit: BoxFit.fill)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class PeriodWars extends StatelessWidget {
  final List<WarsModel> war;

  const PeriodWars({
    super.key,
    required this.war,
  });

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
                  // Navigator.push(context, MaterialPageRoute(builder: (c) {
                  //   return HistoricalPeriodScreen(
                  //     data: state is SuccessGetHistoricalPeriods
                  //         ? state.data
                  //         : [],
                  //     index: i,
                  //   );
                  // }));
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
                            war[i].name,
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
                                image:
                                    CachedNetworkImageProvider(war[i].image)),
                          )),
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
