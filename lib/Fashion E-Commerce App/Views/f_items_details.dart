import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Models/f_model.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Utils/colors.dart';
import 'package:iconsax/iconsax.dart';

class FItemsDetails extends StatefulWidget {
  final FappModel fEcommerceApp;
  const FItemsDetails({
    super.key,
    required this.fEcommerceApp,
  });

  @override
  State<FItemsDetails> createState() => _FItemsDetailsState();
}

class _FItemsDetailsState extends State<FItemsDetails> {
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: fbackgroundColor2,
        centerTitle: true,
        title: const Text("Detail Product"),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Iconsax.shopping_bag,
                size: 28,
              ),
              Positioned(
                right: -3,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: fbackgroundColor2,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) => setState(() {
                currentIndex = value;
              }),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      widget.fEcommerceApp.image,
                      width: size.width * 0.85,
                      height: size.height * 0.40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 4),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == currentIndex
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "H&M",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 17,
                    ),
                    Text(widget.fEcommerceApp.rating.toString()),
                    Text(
                      "(${widget.fEcommerceApp.review})",
                      style: const TextStyle(color: Colors.black26),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  child: Text(
                    widget.fEcommerceApp.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.fEcommerceApp.price.toString()}.00",
                      style: const TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 5),
                    if (widget.fEcommerceApp.isCheck == true)
                      Text(
                        "\$${widget.fEcommerceApp.price + 255}.00",
                        style: const TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black38,
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "$myDescription1 ${widget.fEcommerceApp.name}$myDescription2",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // for color
                          const Text(
                            "Colors",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.fEcommerceApp.fcolor
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final int index = entry.key;
                                final Color color = entry.value;

                                return Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: color,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex =
                                              index; // Update the selected index
                                        });
                                      },
                                      child: Icon(
                                        Icons.check,
                                        color: selectedColorIndex == index
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Size",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 10),
                              child: Row(
                                children: widget.fEcommerceApp.size
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  final int index = entry.key;
                                  final String size = entry.value;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSizeIndex =
                                            index; // Update the selected size
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedSizeIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                        border: Border.all(
                                          color: selectedSizeIndex == index
                                              ? Colors.black
                                              : Colors.black12,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          size,
                                          style: TextStyle(
                                            color: selectedSizeIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: Colors.white,
        onPressed: () {},
        label: SizedBox(
          width: size.width * 0.90,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.shopping_bag,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "ADD TO CART",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: -1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      "BUY NOW",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
