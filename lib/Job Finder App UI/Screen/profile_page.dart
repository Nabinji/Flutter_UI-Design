import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Job%20Finder%20App%20UI/Model/user_info.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          )
        ],
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      "https://media.licdn.com/dms/image/v2/D4E03AQFUcpGFAGfQnA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1680274769856?e=2147483647&v=beta&t=5i793SBGLPhnDpydzt5reC4HBJ6L0k8xKZh3WG9VyKs",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Nabin Paudyal",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Flutter Developer",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black, letterSpacing: -.5),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 4.5,
                    animation: true,
                    percent: 0.8,
                    animationDuration: 1000,
                    center: const Text(
                      "80.0%",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.blueAccent,
                      ),
                    ),
                    progressColor: Colors.blueAccent,
                    footer: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Skill Proficiencey"),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 4.5,
                    animation: true,
                    percent: 0.7,
                    animationDuration: 1000,
                    center: const Text(
                      "70.0%",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    progressColor: Colors.purpleAccent,
                    footer: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Experience level"),
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 4.5,
                    animation: true,
                    percent: 0.95,
                    animationDuration: 1000,
                    center: const Text(
                      "95.0%",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.green,
                      ),
                    ),
                    progressColor: Colors.green,
                    footer: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Profile Completion"),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Project, Skill & Experience",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: userInfo.length,
                  itemBuilder: (context, index) {
                    final info = userInfo[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 7, top: 7),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                info.img,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      info.title,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      info.company,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
