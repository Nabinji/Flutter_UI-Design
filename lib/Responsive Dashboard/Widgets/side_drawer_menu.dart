// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Model/model.dart';
import '../Utils/colors.dart';

class SideDrawerMenu extends StatefulWidget {
  const SideDrawerMenu({super.key});

  @override
  _SideDrawerMenuState createState() => _SideDrawerMenuState();
}

class _SideDrawerMenuState extends State<SideDrawerMenu> {
  int selectedIndex = 0; // Track the selected menu item

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        // height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: MyAppColor.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  child: SvgPicture.asset('assets/dashoboard/three_color.svg'),
                ),
              ),
              ...List.generate(menuIcons.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: SvgPicture.asset(
                            menuIcons[index],
                            color: selectedIndex == index
                                ? Colors.black
                                : MyAppColor.iconGray,
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 3,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
