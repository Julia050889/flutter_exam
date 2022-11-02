import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/pages/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:flutter_exam/pages/leaderboard/leaderboard_provider.dart';
import 'package:flutter_exam/pages/leaderboard/widgets/list_item.dart';
import 'package:provider/provider.dart';

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
                  return buildList(context, state);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }

  Widget buildList(BuildContext context, state) {
    return ListView.builder(
        itemCount: state.board.length,
        itemBuilder: (context, index) {
          return listItem(index, state);
        });
  }
}
