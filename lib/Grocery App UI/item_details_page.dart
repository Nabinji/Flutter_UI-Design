import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_design/Grocery%20App%20UI/add_to_cart_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'contants.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.SURFACE_COLOR,
      appBar: AppBar(
        backgroundColor: Constants.SURFACE_COLOR,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 17),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Product Details',
          style: TextStyle(
              color: Colors.black,
              fontFamily: GoogleFonts.poppins().fontFamily
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset('assets/grocery-ui/ic_shopping.svg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: initWidget(),
      ),
    );
  }

  Widget initWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            "assets/grocery-ui/egg_4.png",
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Container(
            width: 200,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              "Vegetarian Chicken Egg",
              style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/grocery-ui/ic_rating.svg"),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "4.5",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    "\$ 1.40/item",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 17, top: 20),
          child: Text(
            "Description",
            style: TextStyle(
              fontSize: 22,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 17, top: 10),
          child: Text(
            "Vegetarian eggs are eggs which come from \nhens who are fed a vegetarian diet.",
            style: TextStyle(
              fontSize: 16,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 15, right: 10),
          child: Text(
            "- 100% plant-based egg alternative \n- Equivalent to about one dozen eggs \n- Scrambles, bakes, and binds \n- Egg-free, gluten-free, Kosher Parve,",
            style: TextStyle(
              fontSize: 16,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    "Amount",
                    style: TextStyle(
                        fontSize: 21,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff707070)
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: const Icon(
                            Icons.minimize_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff08A045),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 35),
                        child: Text(
                          "Total Price:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32, left: 5),
                        child: Text(
                          "\$4.2",
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Constants.PRIMARY_COLOR
                          ),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const AddToCartPage()
                      ));
                    },
                    child: Container(
                      width: 125,
                      height: 30,
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Constants.PRIMARY_COLOR
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}