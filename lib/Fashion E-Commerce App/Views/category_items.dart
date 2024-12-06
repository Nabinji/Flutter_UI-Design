import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Models/f_category_model.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Models/f_model.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Models/sub_category.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Views/f_items_details.dart';
import 'package:iconsax/iconsax.dart';

import '../Utils/colors.dart';

class CategoryItems extends StatelessWidget {
  final String category;
  final List<FappModel> fcategoryItems;

  const CategoryItems({
    super.key,
    required this.fcategoryItems,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Back Button and Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          hintText: "$category's Fashion",
                          hintStyle: const TextStyle(color: Colors.black38),
                          filled: true,
                          fillColor: fbackgroundColor2,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(
                            Iconsax.search_normal,
                            color: Colors.black38,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal Filter List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCategory.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          children: [
                            Text(filterCategory[index]),
                            const SizedBox(width: 5),
                            index == 0
                                ? const Icon(Icons.filter_list, size: 15)
                                : const Icon(Icons.keyboard_arrow_down,
                                    size: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal Subcategory List
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  subcategory.length,
                  (index) => Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(subcategory[index].image),
                            ),
                            color: fbackgroundColor1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subcategory[index].name,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Expandable GridView
            Expanded(
              child: fcategoryItems.isEmpty
                  ? Center(
                      child: Text(
                        "No items available in this category.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: fcategoryItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        final item = fcategoryItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    FItemsDetails(fEcommerceApp: item),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(item.image),
                                  ),
                                  color: fbackgroundColor2,
                                ),
                                height: size.height * 0.25,
                                width: size.width * 0.5,
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.black26,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  Text(item.rating.toString()),
                                  Text(
                                    "(${item.review})",
                                    style:
                                        const TextStyle(color: Colors.black26),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.5,
                                child: Text(
                                  item.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$${item.price.toString()}.00",
                                    style: const TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  if (item.isCheck == true)
                                    Text(
                                      "\$${item.price.toString()}.00",
                                      style: const TextStyle(
                                        color: Colors.black26,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.black38,
                                      ),
                                    )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
