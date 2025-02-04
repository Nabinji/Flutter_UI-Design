import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_ui_design/Agriplant/Utils/colors.dart';
import 'package:flutter_ui_design/Agriplant/models/product.dart';
import 'package:flutter_ui_design/Agriplant/widgets/product_card.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black12.withOpacity(0.03),
              child: const Icon(Icons.menu),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Wilson! 👏",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Enjoy our services!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                  ),
                )
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 30,
                    color: mainGreenColor,
                  ),
                ),
                const Positioned(
                  right: 12,
                  top: 12,
                  child: CircleAvatar(
                    radius: 6.5,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(15.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    prefixIcon: const Icon(
                      IconlyLight.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: mainGreenColor,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: () {},
                  icon: const Icon(
                    IconlyLight.filter,
                    color: Colors.white,
                    size: 33,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: secondGreenColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(),
                          const Text(
                            "Free consultation",
                            style: TextStyle(
                              color: mainGreenColor,
                              fontSize: 20,
                              letterSpacing: -.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              "Get free support from our customer service",
                              style: TextStyle(fontSize: 16)),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: mainGreenColor,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Call now"),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/agriplant/rb_534.png',
                        width: 200,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "  Featured Products",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(color: mainGreenColor),
                ),
              ),
            ],
          ),
          GridView.builder(
            itemCount: agroProducts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.84,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: agroProducts[index]);
            },
          )
        ],
      ),
    );
  }
}
