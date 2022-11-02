import 'package:dio/dio.dart';
import 'package:flutter_exam/models/quiz/quiz_model.dart';

class QuizApi {
  final Dio appDioClient;

  QuizApi({required this.appDioClient});

  Future<QuizModel> getQuizData() async {
    QuizModel quiz;

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/quiz',
    );

    var res = result.data as Map<String, dynamic>;
    quiz = QuizModel.fromJson(res);

    return quiz;
  }
}
