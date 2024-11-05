import 'package:flutter/material.dart';
import '../const.dart';
import '../Model/doctor.dart';
import '../Model/symptom.dart';
import '../Widgets/doctor_item.dart';
import 'detail_page.dart';

class DoctorAppoinHomePage extends StatelessWidget {
  const DoctorAppoinHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Elsie Adkins',
                      style: TextStyle(
                        fontSize: 32,
                        color: black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/doctor-appoinment/hand.png',
                      width: 42,
                      height: 42,
                    )
                  ],
                ),
                const CircleAvatar(
                  radius: 27,
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/portrait-3d-female-doctor_23-2151107332.jpg?semt=ais_hybrid",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: purple.withOpacity(0.2),
                          blurRadius: 15,
                          spreadRadius: 5,
                          offset: const Offset(-0, 10),
                        )
                      ],
                      color: purple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clinic visit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1,
                              ),
                            ),
                            Text(
                              'Make an appoinment',
                              style: TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          blurRadius: 10,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: purple.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.home_filled,
                            size: 30,
                            color: purple,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home visit',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                letterSpacing: -1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Call the doctor home',
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'What are your symptoms?',
              style: TextStyle(
                fontSize: 22,
                color: black,
                letterSpacing: -.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  symptoms.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 15, right: 15)
                        : const EdgeInsets.only(right: 15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage(
                              symptoms[index].image,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            symptoms[index].label,
                            style: const TextStyle(
                              fontSize: 16,
                              color: black,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 38),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Popular doctors',
              style: TextStyle(
                fontSize: 22,
                color: black,
                letterSpacing: -.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              child: Wrap(
                runSpacing: 14,
                spacing: 16,
                children: [
                  ...List.generate(
                    doctors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              doctor: doctors[index],
                            ),
                          ),
                        );
                      },
                      child: DoctorItem(
                        doctor: doctors[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
