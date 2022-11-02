import 'package:dio/dio.dart';
import 'package:flutter_exam/api/leaderboard/leaderboard_api.dart';
import 'package:flutter_exam/api/purchases_api/purchases_api.dart';
import 'package:flutter_exam/api/quiz/quiz_api.dart';

class AppApi {
  static AppApi? _singleton;

  late LeaderboardApi board;
  late PurchasesApi purchases;
  late QuizApi quiz;

  Dio appDioClient = Dio();

  factory AppApi() {
    if (_singleton == null) {
      _singleton = AppApi._internal();
    }
    return _singleton!;
  }

  AppApi._internal() {
    // Init subclasses
    board = LeaderboardApi(appDioClient);
    purchases = PurchasesApi(appDioClient);
    quiz = QuizApi(appDioClient: appDioClient);
  }
}
