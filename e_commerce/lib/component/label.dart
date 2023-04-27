import "package:flutter/material.dart";

Widget label(String text) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2), color: const Color(0xffe0ecf8)),
    child: Text(
      text,
      style: const TextStyle(color: Color(0xff1f53e4), fontSize: 12),
    ),
  );
}
