import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Grocery%20App%20UI/contants.dart';
import 'package:google_fonts/google_fonts.dart';


class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
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
          'My Cart',
          style: TextStyle(
              color: Colors.black,
              fontFamily: GoogleFonts.poppins().fontFamily
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: initWidget(),
        )
      )
    );
  }

  Widget initWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 25),
          child: Text(
            "Items",
            style: TextStyle(
                fontSize: 19,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              cartListTile("assets/grocery-ui/pine_apple.png", "Pine Apple", "\$4.2", "2"),
              cartListTile("assets/grocery-ui/egg_4.png", "Vegetarian Egg", "\$2.2", "3"),
              cartListTile("assets/grocery-ui/banana.png", "Banana", "\$3.2", "5"),
              cartListTile("assets/grocery-ui/milk.png", "Milk", "\$3.2", "5"),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: Text(
                  "Total",
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 25),
                child: Text(
                  "\$25.46",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Constants.PRIMARY_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Checkbox(
                  value: true, onChanged: null,
                  activeColor: Constants.PRIMARY_COLOR,
                ),
              ),
              Text(
                "Eco-friendly Packaging : Paper bag",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Text(
                  "\$0.05",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Constants.PRIMARY_COLOR,
                  ),
                ),
              ),
            ]
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 25, top: 10),
          child: Text(
            "Help us reduce our use of plastic by buy paper bags. Dont worry Your item is sealed and safe with it.",
            style: TextStyle(
              fontSize: 12,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: Text(
                  "Sub Total",
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 25),
                child: Text(
                  "\$25.51",
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Constants.PRIMARY_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 35, left: 25, right: 25),
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xff08a045),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            "Process to checkout",
            style: TextStyle(
              fontSize: 16,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget cartListTile(String img, String title, String price, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 85,
                height: 85,
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: const Color(0xff08A045).withOpacity(0.4),
                ),
                child: Image.asset(img),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Text(
                                "Price: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 7),
                                child: Text(
                                  price,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.PRIMARY_COLOR
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
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
                                      amount,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: 1,
            bottom: 22,
            child: Container(
              width: 37,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFA0932),
              ),
              child: Image.asset(
                "assets/grocery-ui/cancel_img.png",
                height: 10,
                width: 10,
              ),
            ),
          )
        ]
      ),
    );
  }
}
