import 'package:bloc/bloc.dart';
import 'package:flutter_exam/api/app_api.dart';
import 'package:flutter_exam/models/puchases/purchases_model.dart';
import 'package:meta/meta.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc() : super(PurchasesLoading()) {
    on<GetPurchasesList>((event, emit) async {
      emit(PurchasesLoading());
      final myList = await AppApi().purchases.getPurchasesData();
      emit(PurchasesLoaded(myList));
    });
  }
}
