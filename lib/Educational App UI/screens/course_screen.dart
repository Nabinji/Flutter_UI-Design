import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/models/category.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/widgets/custom_icon_button.dart';
import '../../Health Mobile App/utils/color.dart';
import '../models/course.dart';
import 'course_details_screen.dart';

class CourseScreen extends StatefulWidget {
  final Category category;
  const CourseScreen({super.key, required this.category});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late List<Course> filteredCourses;

  @override
  void initState() {
    super.initState();
    filteredCourses = courses
        .where((course) => course.categoryName == widget.category.name)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                    height: 35,
                    width: 35,
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  const Text(
                    'Development',
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
                  shrinkWrap: true,
                  itemBuilder: (_, int index) {
                    final course = filteredCourses[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  DetailsScreen(course: course,),
                        ),
                      ),
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
                                    color: kPrimaryColor,
                                  ),
                                ],
                              ),
                            ),
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
