import 'package:flutter/material.dart';
import 'package:flutter_ui_design/School%20Management%20App/Utils/colors.dart';

import '../Model/model.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _myCalendarPageState createState() => _myCalendarPageState();
}

class _myCalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          alignment: Alignment.topCenter,
          color: kCardColor,
          height: size.height,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 15),
                    RichText(
                      text: TextSpan(
                        text: "Oct",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: textColor,
                          fontSize: 30,
                        ),
                        children: const [
                          TextSpan(
                            text: " 2019",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Today",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: secondTextColor,
                    fontSize: 18,
                    letterSpacing: -0.5,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 130,
          child: Container(
            height: size.height - 160,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myCalendar("S", 7, false),
                      myCalendar("M", 8, false),
                      myCalendar("T", 9, false),
                      myCalendar("W", 10, true),
                      myCalendar("T", 11, false),
                      myCalendar("F", 12, false),
                      myCalendar("S", 13, false),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        tasks.length,
                        (index) {
                          final task = tasks[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 25),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 13,
                                      decoration: const BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    SizedBox(
                                      width:size.width /
                                          1.15,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: task.currentTime,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                              children: const [
                                                TextSpan(
                                                  text: " AM",
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Text(
                                            task.remainingTime,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 220,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey[300]!,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                    left: 30,
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        task.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        task.subtitle,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundImage:
                                                NetworkImage(task.profileImage),
                                          ),
                                          const SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                task.name,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                task.id,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 22,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 5),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                task.location,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                task.room,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Container myCalendar(
    String weekDay,
    int date,
    bool isActive,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? secondTextColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 75,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            weekDay,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          Text(
            date.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
