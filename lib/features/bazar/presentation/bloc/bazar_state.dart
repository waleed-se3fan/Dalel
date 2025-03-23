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

class CheckBoxState extends BazarState {}

class LoadingAddToCart extends BazarState {}

class SuccessAddToCart extends BazarState {
  final String message;
  SuccessAddToCart(this.message);
}

class FailAddToCart extends BazarState {}

class LoadingGetFromCart extends BazarState {}

class SuccessGetFromCart extends BazarState {
  final List<CartModel> data;
  final List<int> isCheck;
  SuccessGetFromCart(this.data, this.isCheck);
}

class FailGetFromCart extends BazarState {}

class DeleteFromCart extends BazarState {}
