import 'package:dalel/features/home/data/historicalPeriodsModel.dart';
import 'package:dalel/features/home/presentation/view/historical_period_view.dart';
import 'package:dalel/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
