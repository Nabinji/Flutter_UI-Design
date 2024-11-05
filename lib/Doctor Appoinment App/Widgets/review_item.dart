import 'package:flutter/material.dart';
import '../Model/review.dart';
import '../const.dart';

class ReviewItem extends StatelessWidget {
  final Review review;
  const ReviewItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(review.color).withOpacity(0.4),
                backgroundImage: NetworkImage(
                  review.image,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.fullname,
                      style: const TextStyle(
                        color: black,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '1 day ago',
                      style: TextStyle(
                        color: grey,
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      review.rate.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 12,fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review.comment,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: black,
              fontSize: 15,
              letterSpacing: 0,
             fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
