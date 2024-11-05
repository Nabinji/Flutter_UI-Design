import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import '../Model/doctor.dart';
import '../Widgets/review_item.dart';
class DetailPage extends StatelessWidget {
  final Doctor doctor;
  const DetailPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(doctor.color),
                  backgroundImage: NetworkImage(
                    doctor.image,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Dr. ${doctor.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  doctor.specialist,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: const Icon(
                        CupertinoIcons.phone_fill,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: const Icon(
                        CupertinoIcons.chat_bubble_text_fill,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'About doctor',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: black,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Dr. ${doctor.name} ${doctor.about}",
                            maxLines: 2,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              height: 1.5,
                              fontSize: 16,
                              color: black,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Reviews',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: black,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.star,
                                color: Colors.amber[800],
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                rate(doctor).toStringAsFixed(1),
                                style: const TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '(${doctor.reviews.length})',
                                style: const TextStyle(
                                  color: grey,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                          const Text(
                            'See all',
                            style: TextStyle(
                              color: purple,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            doctor.reviews.length,
                            (index) => Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(left: 15, right: 15)
                                  : const EdgeInsets.only(right: 15),
                              child: ReviewItem(
                                review: doctor.reviews[index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 18,
                              color: black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: purple.withOpacity(0.3),
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: purple,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Lotus Medical Center',
                                    style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: -.5,
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    doctor.location,
                                    style: const TextStyle(
                                      color: grey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.3),
              blurRadius: 5,
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Consultation Price',
                  style: TextStyle(
                    letterSpacing: 1,
                    color: grey,
                  ),
                ),
                Text(
                  '\$${doctor.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Book Appoinment',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
