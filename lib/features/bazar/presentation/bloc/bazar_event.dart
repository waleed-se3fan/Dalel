part of 'bazar_bloc.dart';

@immutable
sealed class BazarEvent {}

class GetHistoricalBooksEvent extends BazarEvent {}

class GetHistoricalSouvinersEvent extends BazarEvent {}

class CheckBoxEvent extends BazarEvent {
  final int value;
  final bool isCheck;
  CheckBoxEvent(this.value, this.isCheck);
}

class AddToCartEvent extends BazarEvent {
  final String name;
  final String price;
  final String image;
  AddToCartEvent(this.name, this.price, this.image);
}

class GetFromCartEvent extends BazarEvent {}
