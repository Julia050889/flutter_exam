part of 'quiz_bloc.dart';

@immutable
abstract class QuizPageState {}

class QuizInitial extends QuizPageState {}

class QuizLoading extends QuizPageState {}

class QuizLoaded extends QuizPageState {
  final QuizModel quiz;
  QuizLoaded(this.quiz);
}
