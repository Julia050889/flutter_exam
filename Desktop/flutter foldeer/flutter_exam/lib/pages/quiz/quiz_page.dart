import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/pages/quiz/bloc/quiz_bloc.dart';

class QuizPageWidget extends StatefulWidget {
  const QuizPageWidget({super.key});

  @override
  State<QuizPageWidget> createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget> {
  final QuizBloc newbloc = QuizBloc();

  @override
  void initState() {
    newbloc.add(GetQuizList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizBloc>(
      create: (context) => newbloc,
      child: Scaffold(
          appBar: AppBar(title: Text('Quiz')),
          body: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is QuizLoaded) {
                return PageView.builder(
                    itemCount: state.quiz.questions!.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(state.quiz.questions![index].questionText
                              .toString()),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            child: ListView.builder(
                                itemCount: state
                                    .quiz.questions![index].answers!.length,
                                itemBuilder: ((context, index) {
                                  return ElevatedButton(
                                      onPressed: () {},
                                      child: Text(state.quiz.questions!.first
                                          .answers![index].answerText
                                          .toString()));
                                })),
                          )
                        ],
                      );
                    }));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
