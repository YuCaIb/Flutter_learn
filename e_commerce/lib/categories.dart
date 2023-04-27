import 'productdetail.dart';
import 'package:e_commerce/component/component.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map> products = [
    {
      "isim": "Ultrabook",
      "fotograf":
          "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/asus/thumb/133063-1_large.jpg",
      "price": "900"
    },
    {
      "isim": "superbook",
      "fotograf":
          "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/lenovo/thumb/135948-1_large.jpg",
      "price": "1200"
    },
    {
      "isim": "IosBook",
      "fotograf":
          "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/apple/thumb/114757-1-3_large.jpg",
      "price": "800"
    },
  ];
  final String categoryTitle;
  CategoriesPage(this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            bottomnavigationBar("shop"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(categoryTitle, context),
                  const SizedBox(height: 32),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 3,
                      crossAxisCount: 2,
                      children: products.map((Map products) {
                        return buildContet(
                          products["fotograf"] ?? "",
                          products["isim"] ?? "",
                          products["price"] ?? "",
                          context,
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildContet(String url, String isim, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ProductDetialPage(isim);
          },
        ),
      );
    },
    child: Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            url,
            height: 120,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isim,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "USD $price",
                style: const TextStyle(
                    color: Color(0xff0001fc),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
