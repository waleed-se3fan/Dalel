import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/widgets/custom_header.dart';
import 'package:dalel/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoricalPeriodScreen extends StatelessWidget {
  const HistoricalPeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 28, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomAppbar(),
            PeriodDetailsSection(
                periodName: 'Acncient',
                description:
                    'PeriodDetailsSectionPeriodDetailsSectionPeriodDetailsSectionPeriodDetailsSectionPeriodDetailsSectionPeriodDetailsSection',
                imageUrl:
                    'https://www.warhistoryonline.com/wp-content/uploads/sites/64/2016/07/00-battlephosom.jpg'),
            CustomHeaderText(text: 'Ancient Egypt Wars'),
            PeriodWars(),
            CustomHeaderText(text: 'Recommendations'),
          ],
        ),
      ),
    );
  }
}

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
                    width: 196,
                    height: 220,
                    child: Text(
                      description,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 120,
              height: 203,
              child: Image.network(imageUrl, fit: BoxFit.fill),
            )
          ],
        )
      ],
    );
  }
}

class PeriodWars extends StatelessWidget {
  const PeriodWars({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const PeriodDetailsSection(
                  periodName: 'Egypr',
                  description: 'description',
                  imageUrl:
                      'https://www.warhistoryonline.com/wp-content/uploads/sites/64/2016/07/00-battlephosom.jpg');
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
            height: 96,
            width: 164,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 16,
                ),
                const SizedBox(
                    height: 62,
                    width: 48,
                    child: Text(
                      'Ancient Egypt',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: AppColors.appColor),
                    )),
                Container(
                  height: 64,
                  width: 47,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imagesFrame))),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 10,
                    offset: const Offset(0, 7)),
              ],
              borderRadius: BorderRadius.circular(5)),
          height: 96,
          width: 164,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 16,
              ),
              const SizedBox(
                  height: 62,
                  width: 48,
                  child: Text(
                    'Ancient Egypt',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: AppColors.appColor),
                  )),
              Container(
                height: 64,
                width: 47,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(Assets.imagesFrame))),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
