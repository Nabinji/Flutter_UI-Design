import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/Models/course.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/Utils/color.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/Widgets/list_of_lesson.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/models/lesson.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/widgets/custom_icon_button.dart';
import 'package:flutter_ui_design/Educational%20App%20UI/widgets/my_video_player.dart';

class CourseDetailScreen extends StatefulWidget {
  final Course course;
  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    "Flutter",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 25),
              const MyVideoPlayer(),
              const SizedBox(height: 15),
              Text(
                widget.course.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Author ${widget.course.author}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: Colors.black45,
                  ),
                  Text(
                    " 4.8",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    " 72 Hours",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  Spacer(),
                  Text(
                    " \$50",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: primaryColor1),
                  )
                ],
              ),
              const SizedBox(height: 15),
              // for tabView
              MyTabView(
                changeTab: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                index: selectedIndex,
              ),
              selectedIndex == 0 ? const PlayList() : const Description(),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
          backgroundColor: Colors.white,
          onClosing: () {},
          builder: (context) {
            return SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    CustomIconButton(
                      height: 45,
                      width: 45,
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.pink,size: 30,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomIconButton(
                        height: 45,
                        color: primaryColor1,
                        width: 45,
                        onTap: () {},
                        child: const Text(
                          "Enroll Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: lessonList.length,
        itemBuilder: (context, index) {
          return ListOfLesson(lesson: lessonList[index]);
        },
        separatorBuilder: (_, __) {
          return const SizedBox(height: 20);
        },
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
          "Flutter is a free, open-source framework developed by Google that allows developers to build apps for multiple platforms using a single codebase"),
    );
  }
}

class MyTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const MyTabView({super.key, required this.changeTab, required this.index});

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  final List<String> myList = ['Playlist (22)', 'Description'];

  Widget buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: widget.index == index ? primaryColor1 : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          myList[index],
          style: TextStyle(
              color: widget.index == index ? Colors.white : Colors.black,
              fontWeight:
                  widget.index == index ? FontWeight.bold : FontWeight.normal,
              fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: myList
            .asMap()
            .entries
            .map((MapEntry map) => buildTags(map.key))
            .toList(),
      ),
    );
  }
}
