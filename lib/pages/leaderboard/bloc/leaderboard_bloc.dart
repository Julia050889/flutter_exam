import 'package:bloc/bloc.dart';
import 'package:flutter_exam/api/app_api.dart';
import 'package:flutter_exam/models/leaderboard/leaderboard_model.dart';
import 'package:meta/meta.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardInitial()) {
    on<GetLeaderboardList>((event, emit) async {
      emit(LeaderboardLoading());
      final myList = await AppApi().board.getBoardData();
      emit(LeaderboardLoaded(myList));
    });
  }
}
