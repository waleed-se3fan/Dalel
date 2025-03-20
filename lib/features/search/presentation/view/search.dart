import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/widgets/textfield.dart';
import 'package:dalel/features/home/data/historicalPeriodsModel.dart';
import 'package:dalel/features/home/presentation/view/historical_period_view.dart';
import 'package:dalel/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CustomSearch(),
              state is SuccessGetSearchData
                  ? SearchItems(
                      model: state.data,
                    )
                  : state is SuccessGetSavedData
                      ? ResentSearch(savedData: state.savedData)
                      : const Center(
                          child: CircularProgressIndicator(),
                        )
            ],
          ),
        );
      },
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.brown,
          ),
        ),
        SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width * .79,
          child: CustomTextFeild(
            onChanged: (name) {
              context.read<SearchBloc>().add(GetSearchEvent(name
                  //.replaceFirst(name[0], name[0].toUpperCase())
                  ));
            },
            prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            textColor: Colors.white,
            fillColor: AppColors.appColor,
            hintText: 'Search deep into the history',
          ),
        )
      ],
    );
  }
}

class SearchItems extends StatelessWidget {
  final List<HistoricalPeriodsModel> model;
  const SearchItems({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<SearchBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.separated(
              separatorBuilder: (c, i) {
                return const Divider(
                  color: Colors.grey,
                );
              },
              itemCount: model.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return HistoricalPeriodScreen(
                        data: model,
                        index: index,
                      );
                    }));
                    myBloc.SaveData(model[index].name);
                  },
                  child: Card(
                    shadowColor: Colors.grey,
                    color: Colors.white,
                    child: Container(
                        height: 80,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(
                            model[index].name,
                          ),
                          subtitle: Text(
                            model[index].summary,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class ResentSearch extends StatelessWidget {
  final List savedData;
  const ResentSearch({super.key, required this.savedData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            'Recent',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.headertext),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 200,
            child: GridView.builder(
              itemCount: savedData.length,
              itemBuilder: (c, i) {
                return Card(
                  color: Colors.white,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      savedData[i],
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 3),
            ),
          ),
        ],
      ),
    );
  }
}
