import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/Models/category.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/Models/course.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/Screens/course_detail_screen.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/Utils/color.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/widgets/custom_icon_button.dart';

class CourseScreen extends StatefulWidget {
  final Category category;
  const CourseScreen({super.key, required this.category});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late List<Course> filteredCourses;
  @override
  void initState() {
    filteredCourses = courses
        .where((myCourse) => myCourse.categoryName == widget.category.name)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                    height: 40,
                    width: 40,
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  const Text(
                    "Development",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: filteredCourses.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailScreen(course: course),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                course.image,
                                width: 70,
                                fit: BoxFit.cover,
                                height: 60,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Author ${course.author}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                LinearProgressIndicator(
                                    value: course.completedPercentage,
                                    backgroundColor: Colors.black12,
                                    color: primaryColor1)
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
