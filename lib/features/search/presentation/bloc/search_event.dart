part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class GetSearchEvent extends SearchEvent {
  final String name;
  GetSearchEvent(this.name);
}

class GetSavedData extends SearchEvent {}
