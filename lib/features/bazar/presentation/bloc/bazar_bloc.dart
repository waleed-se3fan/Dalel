import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/bazar/data/historical_books_model.dart';
import 'package:dalel/features/bazar/data/historical_souviners_model.dart';
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
}
