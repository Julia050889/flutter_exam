import 'package:dio/dio.dart';
import 'package:flutter_exam/models/leaderboard/leaderboard_model.dart';

class LeaderboardApi {
  final Dio appDioClient;

  LeaderboardApi(
    this.appDioClient,
  );

  Future<List<LeaderboardModel>> getBoardData() async {
    List<LeaderboardModel> board = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/leaderboard',
    );

    if (result.data is List) {
      board = result.data
          .map<LeaderboardModel>(
            (e) => LeaderboardModel.fromJson(e),
          )
          .toList();
    }
    return board;
  }
}
