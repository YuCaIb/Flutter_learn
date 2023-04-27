import 'package:e_commerce/component/component.dart';
import 'package:e_commerce/component/label.dart';
import 'package:e_commerce/katagori.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  buildBaslik(),
                  //banner
                  banneryap(),
                  //buttons
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildnav(
                            text: "Categories",
                            icon: Icons.menu,
                            widget: Categories(),
                            context: context),
                        buildnav(
                          text: "Favs",
                          icon: Icons.star,
                        ),
                        buildnav(
                          text: "gifts",
                          icon: Icons.card_giftcard,
                        ),
                        buildnav(
                          text: "best sellers",
                          icon: Icons.sell,
                        ),
                      ],
                    ),
                  ),
                  //saless title
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "sales",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff0a1034),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      salesItembuild(
                          productname: "IOS Phone",
                          url:
                              "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/apple/thumb/135152-1-8_large.jpg",
                          saleratio: "%50",
                          screenwidth: screenwidth),
                      salesItembuild(
                          productname: "Notebook",
                          url:
                              "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/lenovo/thumb/135948-1_large.jpg",
                          saleratio: "%30",
                          screenwidth: screenwidth),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      salesItembuild(
                          productname: "IOS Phone",
                          url:
                              "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/apple/thumb/135152-1-8_large.jpg",
                          saleratio: "%50",
                          screenwidth: screenwidth),
                      salesItembuild(
                          productname: "Notebook",
                          url:
                              "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/lenovo/thumb/135948-1_large.jpg",
                          saleratio: "%30",
                          screenwidth: screenwidth),
                    ],
                  )
                ],
              ),
            ),
            //bottomNav
            bottomnavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}

Widget banneryap() {
  return Padding(
    padding: const EdgeInsets.only(top: 24),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "Bose Home Speaker",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "500 TL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 80,
            height: 70,
            child: Image.network(
              'https://cdn.vatanbilgisayar.com/Upload/PRODUCT/oppo/thumb/kri-stal_large.jpg',
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildnav({
  required String text,
  required IconData icon,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return widget!;
          },
        ),
      );
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 19,
            vertical: 22,
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE0ECF8),
          ),
          child: Icon(
            icon,
            color: const Color(0xff0001fc),
            size: 18,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff0001fc),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget salesItembuild({
  required String productname,
  required String saleratio,
  required String url,
  required double screenwidth,
}) {
  return Container(
    width: (screenwidth - 60) * 0.5,
    padding: const EdgeInsets.only(top: 12, left: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //%50
        label(saleratio),
        //resim
        const SizedBox(
          height: 22,
        ),
        Image.network(
          url,
          height: 180,
        ),
        //ismi
        Center(
          child: Text(
            productname,
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xff0a1034),
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
