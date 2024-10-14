import 'package:flutter/material.dart';
import 'package:flutter_ui_design/School%20Management%20App/Utils/colors.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kheaderColor,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: "Wed",
                      style: TextStyle(
                        color: textColor,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w900,
                      ),
                      children: [
                        TextSpan(
                          text: " 10 Oct",
                          style: TextStyle(
                            letterSpacing: -1,
                            color: textColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            blurRadius: 7,
                            spreadRadius: 7,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://img.freepik.com/free-photo/close-up-view-strict-young-handsome-caucasian-man-wearing-glasses-standing-profile-view-isolated-crimson-wall_141793-79811.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi Jackie",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Here is a list of schedule\nyou need to check...",
                          style: TextStyle(
                            height: 1.8,
                            color: textColor.withOpacity(0.75),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 220,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView(
              children: [
                seeAllItems("TODAY CLASSES", 3),
                const SizedBox(height: 20),
                todayclassesItems(
                  "07:00",
                  "The Basic of Typography II",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&s",
                  "Gabriel Sutton",
                ),
                todayclassesItems(
                  "09:30",
                  "Design Psychology: Principle of Arts",
                  "https://media.istockphoto.com/id/1154642632/photo/close-up-portrait-of-brunette-woman.jpg?s=612x612&w=0&k=20&c=d8W_C2D-2rXlnkyl8EirpHGf-GpM62gBjpDoNryy98U=",
                  "Jessie Reeves",
                ),
                const SizedBox(height: 20),
                seeAllItems("YOUR TASKS", 4),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      yourTaskItems(
                        Colors.red,
                        3,
                        "The Basic of Typography II",
                      ),
                       yourTaskItems(
                        Colors.green,
                        10,
                        "Design Psychology: Principle of arts",
                      ),
                       yourTaskItems(
                       Colors.red,
                        10,
                        "Design Psychology: Principle of arts",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container yourTaskItems(Color color, int dayLeft, String courseTitle) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      height: 170,
      width: 175,
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Deadline",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black26,
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 4,
                backgroundColor: color,
              ),
              const SizedBox(width: 5),
              Text(
                "$dayLeft days left",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 130,
            child: Text(
              courseTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row seeAllItems(title, number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: "($number)",
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Text(
          "See all",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: secondTextColor,
              fontSize: 15),
        )
      ],
    );
  }

  Container todayclassesItems(time, title, profile, name) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 110,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                "AM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Container(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: const Text(
                        "Room C1, Faculty of Art & Design Building",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(profile),
                      radius: 12,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
