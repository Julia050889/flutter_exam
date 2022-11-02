import 'package:bloc/bloc.dart';
import 'package:flutter_exam/api/app_api.dart';
import 'package:flutter_exam/models/quiz/quiz_model.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<GetQuizList>((event, emit) async {
      emit(QuizLoading());
      final myList = await AppApi().quiz.getQuizData();
      emit(QuizLoaded(myList));
    });
  }
}
