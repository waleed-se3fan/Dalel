part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class SuccessGetHistoricalPeriods extends HomeState {
  final List<HistoricalPeriodsModel> data;
  SuccessGetHistoricalPeriods(this.data);
}

class FialGetHistoricalPeriods extends HomeState {}

class LoadingGetHistoricalPeriods extends HomeState {}
