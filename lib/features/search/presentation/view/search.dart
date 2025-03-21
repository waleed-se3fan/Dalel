import 'package:dalel/features/search/presentation/bloc/search_bloc.dart';
import 'package:dalel/features/search/presentation/widgets/custom_search.dart';
import 'package:dalel/features/search/presentation/widgets/resrent_search.dart';
import 'package:dalel/features/search/presentation/widgets/searchitem.dart';
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
                      : const Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        )
            ],
          ),
        );
      },
    );
  }
}
