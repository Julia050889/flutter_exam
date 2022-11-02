import 'package:flutter/cupertino.dart';
import 'package:flutter_exam/api/app_api.dart';
import 'package:flutter_exam/models/leaderboard/leaderboard_model.dart';

class LeaderboardPageprovider extends ChangeNotifier {
  LeaderboardPageprovider() {
    getData();
  }
  List<LeaderboardModel> board = [];
  int index = 10;

  bool isLoading = false;
  //bool selected = false;

  getData() async {
    isLoading = true;
    final result = await AppApi().board.getBoardData();
    board = result;
    isLoading = false;

    notifyListeners();

    return board;
  }

  // onSelectedColor(int) {
  //   selected = !selected;
  //   notifyListeners();
  // }
}
