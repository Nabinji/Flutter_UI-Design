import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Cinema%20App%20UI/Widget/movie_info.dart';
import 'package:flutter_ui_design/Cinema%20App%20UI/consts.dart';
import 'package:flutter_ui_design/Cinema%20App%20UI/models/movie_model.dart';
import 'package:flutter_ui_design/Cinema%20App%20UI/pages/reservation_screen.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Movie Detail",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 335,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: movie.poster,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          movie.poster,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MovieInfo(
                          icon: Icons.videocam_rounded,
                          name: "Genera",
                          value: movie.genre,
                        ),
                        MovieInfo(
                          icon: Icons.timer,
                          name: "Duration",
                          value: formatTime(
                            Duration(minutes: movie.duration),
                          ),
                        ),
                        MovieInfo(
                          icon: Icons.star,
                          name: "Rating",
                          value: "${movie.rating}/10",
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              const Text(
                "Synopsis",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                movie.synopsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white60,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff1c1c27),
              blurRadius: 60,
              spreadRadius: 80,
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          label: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ReservationScreen(),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            color: buttonColor,
            height: 70,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Center(
                child: Text(
                  "Get Reservation",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
