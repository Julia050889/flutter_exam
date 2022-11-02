import 'package:flutter/material.dart';
import 'package:flutter_exam/base/styles/color.dart';

List colors = [Style.orange, Style.red, Style.blue, Style.green, Colors.yellow];

Widget listItem(index, provider) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    decoration: BoxDecoration(
        border: Border.all(color: Style.gray),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35), bottomRight: Radius.circular(35))),
    child: ListTile(
      onTap: (() {}),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 30.0,
              backgroundColor: colors[index],
              child: Text(
                provider.board[index].firstName.toString().substring(0, 1),
                style: const TextStyle(fontSize: 26, color: Colors.white),
              )),
          const SizedBox(
            width: 30,
          ),
          Text(provider.board[index].firstName,
              style: const TextStyle(color: Style.gray, fontSize: 24)),
        ],
      ),
      trailing: Text(
        provider.board[index].score.toString(),
        style: const TextStyle(color: Style.gray, fontSize: 22),
      ),
      leading: Text('${index + 1} .',
          style: const TextStyle(fontSize: 22, color: Style.gray)),
    ),
  );
}
