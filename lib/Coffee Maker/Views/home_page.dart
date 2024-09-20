import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../consts.dart';
import '../Models/product_model.dart';
import '../widgets/product_item.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCategory = 'All';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondBackgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: [
          const SizedBox(width: 25),
          Image.network(
            "https://static.thenounproject.com/png/1614628-200.png",
            height: 35,
            width: 35,
            color: Colors.white,
          ),
          const Spacer(),
          Image.network(
            "https://www.freepnglogos.com/uploads/search-png/search-tubshroom-the-revolutionary-hair-catcher-snare-and-31.png",
            height: 20,
            width: 20,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          const Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Colors.white,
              ),
              Positioned(
                right: 5,
                top: 3,
                child: Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 10,
                ),
              ),
            ],
          ),
          const SizedBox(width: 30),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.4,
            color: backgroundColor,
          ),
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Find your best\n',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'coffee maker ',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'style',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 40),
                child: CarouselSlider.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                product: products[index],
                              ),
                            ),
                          );
                        },
                        child: ProductItem(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: .75,
                    padEnds: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    height: size.height * .5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Trendy Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      categories.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentCategory = categories[index];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: currentCategory == categories[index]
                                  ? Border.all(
                                      color: Colors.black26, width: 1.5)
                                  : const Border(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              categories[index],
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                   width: size.width * 0.48,
                  height: 200,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width*0.43,
                        height: 200,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey .withOpacity(.2),
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(products[index].image),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
