import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/widgets/custom_header.dart';
import 'package:dalel/features/home/presentation/view/historical_period_view.dart';
import 'package:dalel/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomAppbar(),
          CustomHeaderText(
            text: 'Historical periods',
          ),
          HistoricalPeriod(),
          CustomHeaderText(
            text: 'Historical Characters',
          ),
          HistoricalCharacters(),
          CustomHeaderText(
            text: 'Historical Souvenirs',
          ),
          HistoricalSouvenirs()
        ],
      ),
    );
  }
}

class HistoricalPeriod extends StatelessWidget {
  const HistoricalPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const HistoricalPeriodScreen();
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

class HistoricalCharacters extends StatelessWidget {
  const HistoricalCharacters({super.key});

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
