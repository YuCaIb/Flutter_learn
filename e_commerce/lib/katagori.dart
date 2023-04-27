import 'package:e_commerce/categories.dart';
import 'package:e_commerce/component/component.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<String> categoriesList = [
    "All",
    "Laptops",
    "Smartphones",
    "Accsories",
    "watches",
    "spekars",
    "All",
    "Laptops",
    "Smartphones",
    "Accsories",
    "watches",
    "spekars"
  ];

  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  header("Categories", context),
                  Expanded(
                    child: ListView(
                      children: categoriesList
                          .map((String title) =>
                              buildCatNav(title: title, context: context))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            bottomnavigationBar("search")
          ],
        ),
      ),
    );
  }
}

//
Widget buildCatNav({
  required String title,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return CategoriesPage(title);
          },
        ),
      );
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xff0a1034),
        ),
      ),
    ),
  );
}
