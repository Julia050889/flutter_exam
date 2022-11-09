import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/pages/quiz/bloc/quiz_bloc.dart';
import 'dart:async';

List colorList = [Style.orange, Style.red];

class QuizPageWidget extends StatelessWidget {
  const QuizPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizPageBloc>(
      create: (context) => QuizPageBloc()..add(GetQuizList()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Style.orange,
          ),
          body: BlocBuilder<QuizPageBloc, QuizPageState>(
            builder: (context, state) {
              if (state is QuizLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: PageView.builder(
                      itemCount: state.quiz.questions!.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              state.quiz.questions![index].questionText
                                  .toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            buildTimer(),
                            // if(state.quiz.questions![index].questionImageUrl) {

                            // }
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              height: 250,
                              child: ListView.builder(
                                  itemCount: state
                                      .quiz.questions![index].answers!.length,
                                  itemBuilder: ((context, ind) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            elevation: 3,
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                          ),
                                          child: Text(
                                            state.quiz.questions![index]
                                                .answers![ind].answerText
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87),
                                          )),
                                    );
                                  })),
                            )
                          ],
                        );
                      })),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }

  Widget buildTimer() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CircularProgressIndicator(
            //value: second / maxsecond,
            strokeWidth: 10,
            color: Style.orange,
          ),
          TweenAnimationBuilder(
              tween: Tween<int>(begin: 20, end: 0),
              duration: const Duration(seconds: 1),
              builder: (BuildContext _, int, Widget) {
                return const Center(child: Text('5'));
              })
        ],
      ),
    );
  }
}
