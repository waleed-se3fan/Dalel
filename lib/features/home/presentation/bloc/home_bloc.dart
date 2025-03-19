import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/home/data/historicalPeriodsModel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetHistoricalPeriods>((event, emit) {
      getHistoricalPeriods(event.collectionName);
    });
  }

  Future<List<HistoricalPeriodsModel>> getHistoricalPeriods(
      String collectionName) async {
    emit(LoadingGetHistoricalPeriods());
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection(collectionName).get();

      List<HistoricalPeriodsModel> mydata = data.docs
          .map((e) => HistoricalPeriodsModel.fromFireBase(e.data()))
          .toList();
      print(mydata);
      emit(SuccessGetHistoricalPeriods(mydata));
      return mydata;
    } catch (e) {
      print(e.toString());
      emit(FialGetHistoricalPeriods());
      return [];
    }
  }
}
