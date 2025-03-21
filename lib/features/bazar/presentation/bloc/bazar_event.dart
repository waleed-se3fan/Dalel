part of 'bazar_bloc.dart';

@immutable
sealed class BazarEvent {}

class GetHistoricalBooksEvent extends BazarEvent {}

class GetHistoricalSouvinersEvent extends BazarEvent {}
