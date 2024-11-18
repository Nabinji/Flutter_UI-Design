import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: SvgPicture.asset(
              'assets/dashoboard/calendar.svg',
              width: 20,
            ),
            onPressed: () {}),
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
                icon: SvgPicture.asset(
                  'assets/dashoboard/notification.svg',
                  width: 20.0,
                ),
                onPressed: () {}),
          ],
        ),
        const SizedBox(width: 15),
        const Row(children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(
                  'https://cdn.prod.website-files.com/6600e1eab90de089c2d9c9cd/662c092880a6d18c31995dfd_66236531e8288ee0657ae7a7_Business%2520Professional.webp',
                ),
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
        ]),
      ],
    );
  }
}
