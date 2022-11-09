import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  DescriptionBloc() : super(DescriptionState()) {
    on<OnChangeIndex>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
