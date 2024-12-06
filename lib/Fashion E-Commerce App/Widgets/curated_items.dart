import 'package:flutter/material.dart';
import '../Models/f_model.dart';
import '../Utils/colors.dart';

class CuratedItems extends StatelessWidget {
  const CuratedItems({
    super.key,
    required this.eCommerceItems,
    required this.size,
  });

  final FappModel eCommerceItems;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(eCommerceItems.image),
            ),
            color: fbackgroundColor2,
          ),
          height: size.height * 0.25,
          width: size.width * 0.5,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black26,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "H&M",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black26,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 17,
            ),
            Text(eCommerceItems.rating.toString()),
            Text(
              "(${eCommerceItems.review})",
              style: const TextStyle(color: Colors.black26),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            eCommerceItems.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "\$${eCommerceItems.price.toString()}.00",
              style: const TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 1.5,
              ),
            ),
            const SizedBox(width: 5),
            if (eCommerceItems.isCheck == true)
              Text(
                "\$${eCommerceItems.price.toString()}.00",
                style: const TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black38,
                ),
              )
          ],
        ),
      ],
    );
  }
}
