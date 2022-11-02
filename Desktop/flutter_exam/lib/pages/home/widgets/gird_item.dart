import 'package:flutter/material.dart';

Widget gridItem({
  route,
  context,
  text,
  image,
  color,
  topleft,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route ?? '/description');
    },
    child: Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: topleft
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))
              : const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
      height: 150,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image,
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
