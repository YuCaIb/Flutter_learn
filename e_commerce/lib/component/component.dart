import 'package:flutter/material.dart';

Widget bottomnavigationBar(String page) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -3),
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
          ),
        ],
        color: const Color(0xffeff5fb),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(iconData: Icons.home_filled, active: page == "home"),
          buildNavIcon(iconData: Icons.search, active: page == "search"),
          buildNavIcon(iconData: Icons.shopping_basket, active: page == "shop"),
          buildNavIcon(iconData: Icons.person, active: page == "person"),
        ],
      ),
    ),
  );
}

Widget buildNavIcon({required IconData iconData, required bool active}) {
  return Icon(
    iconData,
    color: Color(active ? 0xff0001fc : 0xff0A1034),
  );
}

Widget header(String title, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 29),
      //backıcon
      GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 27,
          )),
      const SizedBox(height: 24),
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Color(0xff0a1034),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}
