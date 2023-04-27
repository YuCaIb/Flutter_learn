import 'package:e_commerce/component/component.dart';
import 'package:e_commerce/component/label.dart';
import 'package:flutter/material.dart';

class ProductDetialPage extends StatefulWidget {
  final String productTitle;

  const ProductDetialPage(this.productTitle, {super.key});

  @override
  State<ProductDetialPage> createState() => _ProductDetialPageState();
}

class _ProductDetialPageState extends State<ProductDetialPage> {
  List<Color> colors = [
    const Color(0xff52514f),
    const Color(0xff0001fc),
    const Color(0xff6f7544),
    const Color(0xfff58c00),
  ];

  Color selectedcolor = Color(0xff52514f);
  int selectedCapacity = 128;

  List<int> capacitiyList = [128, 256, 512, 1000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            header(widget.productTitle, context),
            const SizedBox(height: 32),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    label("New"),
                    const SizedBox(height: 25),
                    Image.network(
                      "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/lenovo/thumb/134370-1-1_large.jpg",
                      height: 180,
                    ),
                    const SizedBox(height: 30),
                    const Text("Color",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0a1034))),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: colors
                          .map(
                            (Color color) => colorOption(
                                color: color,
                                selected: selectedcolor == color,
                                onTap: () {
                                  setState(
                                    () {
                                      selectedcolor = color;
                                    },
                                  );
                                }),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 32),
                    const Text("Capacity",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0a1034))),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: capacitiyList
                          .map((int number) => capacitiyOption(
                              capacity: number,
                              selected: selectedCapacity == number,
                              onTap: () {
                                setState(
                                  () {
                                    selectedCapacity = number;
                                  },
                                );
                              }))
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        print("product added to cart");
                        print("name of the product: " + widget.productTitle);
                        print("color of the product: " +
                            selectedcolor.value.toString());
                        print("capacitiy of product: " +
                            selectedCapacity.toString());
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff1f53e4),
                        ),
                        child: const Text(
                          "Add To Cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ))
          ])),
      bottomnavigationBar("search"),
      SizedBox(height: 100)
    ])));
  }
}

Widget colorOption(
    {required Color color, required bool selected, required Function onTap}) {
  return GestureDetector(
      onTap: onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
                color: const Color(0xff0001fc), width: selected ? 3 : 0)),
        width: 23,
        height: 23,
      ));
}

Widget capacitiyOption(
    {required int capacity, required bool selected, required Function onTap}) {
  return GestureDetector(
    onTap: onTap(),
    child: Container(
      margin: const EdgeInsets.only(left: 10),
      child: Text(
        "$capacity GB",
        style: TextStyle(
            color: selected
                ? const Color.fromARGB(255, 0, 1, 252)
                : const Color.fromARGB(255, 167, 169, 190),
            fontSize: 16),
      ),
    ),
  );
}
