part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class GetHistoricalPeriods extends HomeEvent {
  final String collectionName;
  GetHistoricalPeriods(this.collectionName);
}
