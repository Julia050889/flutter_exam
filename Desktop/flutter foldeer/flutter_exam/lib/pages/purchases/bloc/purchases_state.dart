part of 'purchases_bloc.dart';

@immutable
abstract class PurchasesState {}

// class PurchasesInitial extends PurchasesState {}

class PurchasesLoading extends PurchasesState {}

class PurchasesLoaded extends PurchasesState {
  final List<PurchasesModel> purchases;
  PurchasesLoaded(this.purchases);
}
