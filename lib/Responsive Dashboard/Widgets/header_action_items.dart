import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderActionItems extends StatelessWidget {
  const HeaderActionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/dashoboard/calendar.svg",
            width: 20,
          ),
        ),
        const SizedBox(width: 10),
        Stack(
          children: [
            const Positioned(
              top: 8,
              right: 7,
              child: CircleAvatar(
                radius: 3,
                backgroundColor: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/dashoboard/notification.svg",
                width: 20,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        const Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundImage: NetworkImage(
                      "https://thumbs.dreamstime.com/b/making-choices-9379010.jpg"),
                ),
                Positioned(
                  bottom: 3,
                  right: 0,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(width: 5),
            RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 5),
          ],
        )
      ],
    );
  }
}
