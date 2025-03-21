part of 'bazar_bloc.dart';

@immutable
sealed class BazarState {}

final class BazarInitial extends BazarState {}

class SuccessGetHistoricalBooks extends BazarState {
  final List<HistoricalBoxModel> data;
  SuccessGetHistoricalBooks(this.data);
}

class LoadingGetHistoricalBooks extends BazarState {}

class FailGetHistoricalBooks extends BazarState {}

class SuccessGetHistoricalSouviners extends BazarState {
  final List<HistoricalSouvinersModel> data;
  SuccessGetHistoricalSouviners(this.data);
}

class LoadingGetHistoricalSouviners extends BazarState {}

class FailGetHistoricalSouviners extends BazarState {}
