import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/models/leaderboard/leaderboard_model.dart';
import 'package:flutter_exam/pages/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:flutter_exam/pages/leaderboard/widgets/list_item.dart';

class LeaderBoardPageWidget extends StatelessWidget {
  const LeaderBoardPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeaderboardBloc>(
        create: (context) => LeaderboardBloc()..add(GetLeaderboardList()),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Style.orange,
              title: const Text(
                'Leaderboard',
                style: TextStyle(fontSize: 24),
              ),
              centerTitle: true,
              automaticallyImplyLeading: true,
            ),
            body: BlocBuilder<LeaderboardBloc, LeaderboardState>(
              builder: (context, state) {
                if (state is LeaderboardLoaded) {
                  return buildList(
                      context,
                      state.board
                        ..sort((a, b) => b.score!.compareTo(a.score!)));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }

  Widget buildList(BuildContext context, List<LeaderboardModel> boardList) {
    return ListView.builder(
        itemCount: boardList.length,
        itemBuilder: (context, index) {
          return listItem(index, boardList);
        });
  }
}
