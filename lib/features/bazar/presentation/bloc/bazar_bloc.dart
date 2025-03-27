import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/bazar/data/cart_model.dart';
import 'package:dalel/features/bazar/data/historical_books_model.dart';
import 'package:dalel/features/bazar/data/historical_souviners_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'bazar_event.dart';
part 'bazar_state.dart';

class BazarBloc extends Bloc<BazarEvent, BazarState> {
  BazarBloc() : super(BazarInitial()) {
    on<BazarEvent>((event, emit) {});
    on<GetHistoricalBooksEvent>((event, emit) {
      getHistoricalBooks();
    });
    on<GetHistoricalSouvinersEvent>((event, emit) {
      getHistoricalSouviners();
    });
    on<CheckBoxEvent>((event, emit) {
      checkBox(event.value, event.isCheck);
    });
    on<AddToCartEvent>((event, emit) {
      addToCart(event.name, event.price, event.image);
    });
    on<GetFromCartEvent>((event, emit) {
      getFromCart();
    });
  }

  getHistoricalBooks() async {
    emit(LoadingGetHistoricalBooks());
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection('Historical Books').get();
      print(data);
      List<HistoricalBoxModel> list = data.docs
          .map((e) => HistoricalBoxModel.fromFireStore(e.data()))
          .toList();
      emit(SuccessGetHistoricalBooks(list));
    } catch (e) {
      print(e.toString());
      emit(FailGetHistoricalBooks());
    }
  }

  getHistoricalSouviners() async {
    emit(LoadingGetHistoricalSouviners());
    try {
      QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection('Historical souvenirs')
          .get();
      print(data);
      List<HistoricalSouvinersModel> list = data.docs
          .map((e) => HistoricalSouvinersModel.fromFireStore(e.data()))
          .toList();
      emit(SuccessGetHistoricalSouviners(list));
    } catch (e) {
      print(e.toString());
      emit(FailGetHistoricalSouviners());
    }
  }

  int index = 0;
  double totalPrice = 0.0;
  List<int> checkList = [];
  checkBox(index, value) {
    if (state is SuccessGetFromCart) {
      final currentState = state as SuccessGetFromCart;
      if (!checkList.contains(index)) {
        checkList.add(index);
      } else {
        checkList.remove(index);
      }
      emit(SuccessGetFromCart(currentState.data, checkList, totalPrice));
    } else {}
  }

  addToCart(String name, String price, String image) async {
    emit(LoadingAddToCart());
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .add({'name': name, 'price': '$price \$', 'image': image});
      totalPrice += 25;

      emit(SuccessAddToCart('  successfully added'));
    } catch (e) {
      print(e.toString());
      emit(FailAddToCart());
    }
  }

  List<CartModel> carts = [];
  getFromCart() async {
    emit(LoadingGetFromCart());
    try {
      QuerySnapshot<Map<String, dynamic>> docs =
          await FirebaseFirestore.instance.collection('cart').get();
      carts = docs.docs.map((e) => CartModel.fromFire(e.data(), e.id)).toList();
      print(carts[0].name);
      print(totalPrice);
      emit(SuccessGetFromCart(carts, [], totalPrice));
    } catch (e) {
      emit(FailGetFromCart());
    }
  }

  deleteFromCart() {
    print(carts.length);
    for (index in checkList) {
      FirebaseFirestore.instance
          .collection('cart')
          .doc(carts[index].id)
          .delete();
      carts.removeAt(index);
    }
    checkList.clear();
    totalPrice -= 25;

    emit(SuccessGetFromCart(carts, checkList, totalPrice));
  }
}
