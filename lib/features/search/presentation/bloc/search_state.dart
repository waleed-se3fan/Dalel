part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class LoadingGetSearchData extends SearchState {}

class SuccessGetSearchData extends SearchState {
  final List<HistoricalPeriodsModel> data;
  SuccessGetSearchData(this.data);
}

class FailGetSearchData extends SearchState {}

class LoadingGetSavedData extends SearchState {}

class SuccessGetSavedData extends SearchState {
  final List<String> savedData;
  SuccessGetSavedData(this.savedData);
}

class FailGetSavedData extends SearchState {}
