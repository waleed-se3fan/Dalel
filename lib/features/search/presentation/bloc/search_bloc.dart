// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/features/home/data/historicalPeriodsModel.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<GetSearchEvent>((event, emit) {
      search(event.name);
    });
    on<GetSavedData>((event, emit) {
      getSavedDat();
    });
  }

  search(String name) async {
    emit(LoadingGetSearchData());
    try {
      if (name.isNotEmpty) {
        var querySnapshot = await FirebaseFirestore.instance
            .collection('Historical Characters')
            .orderBy('name')
            .startAt([name]).endAt([name + '\uf8ff']).get();

        List<HistoricalPeriodsModel> data = querySnapshot.docs
            .map((e) => HistoricalPeriodsModel.fromFireBase(e.data()))
            .toList();
        emit(SuccessGetSearchData(data));
      } else {
        add(GetSavedData());
      }
    } catch (e) {
      emit(FailGetSearchData());
    }
  }

  List<String> lastSearched = [
    'waleed',
    'mohammed',
  ];

  SaveData(String word) async {
    CacheHelper.init();
    lastSearched.add(word);
    await CacheHelper.saveData(key: 'keeey', value: lastSearched)
        .then((value) => print(value.toString()));
    CacheHelper.init();
  }

  getSavedDat() async {
    emit(LoadingGetSavedData());
    try {
      CacheHelper.init();

      SharedPreferences _preferences = await SharedPreferences.getInstance();
      lastSearched = _preferences.getStringList('keeey')!;
      emit(SuccessGetSavedData(lastSearched!));
    } catch (e) {
      emit(FailGetSavedData());
    }
  }
}
