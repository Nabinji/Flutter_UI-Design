import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Coffee%20Maker/Widgets/play_vide.dart';
import 'package:flutter_ui_design/Coffee%20Maker/consts.dart';
import 'package:video_player/video_player.dart';

import '../Models/product_model.dart';

class DetailPageCoffee extends StatefulWidget {
  final ProductModel productModel;
  const DetailPageCoffee({
    super.key,
    required this.productModel,
  });

  @override
  State<DetailPageCoffee> createState() => _DetailPageCoffeeState();
}

class _DetailPageCoffeeState extends State<DetailPageCoffee> {
    late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    // Initialize video player controller with the asset
    _videoPlayerController = VideoPlayerController.asset(widget.productModel.video)
      ..initialize().then(
        (_) {
          setState(
            () {},
          ); // Update UI after video is initialized
        },
      );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            expandedHeight: size.height * 0.55,
            backgroundColor: secondBackgroundColor,
            pinned: true,
            collapsedHeight: kToolbarHeight,
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                FlexibleSpaceBar(
                  background: Container(
                    padding: const EdgeInsets.all(40),
                    child: Hero(
                      tag: widget.productModel.image,
                      child: Image.asset(
                        widget.productModel.image,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 20,
                  bottom: -37,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: buttonColor,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList.list(children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "${"\$${widget.productModel.price}".split('.')[0]}.",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: (widget.productModel.price)
                              .toStringAsFixed(2)
                              .split('.')[1],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.productModel.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.productModel.subName,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    thickness: 2,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.pedal_bike,
                            color: buttonColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Free Delivery",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_outline_rounded,
                            color: buttonColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            " Rating${widget.productModel.rating}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.productModel.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "How ot pouring coffee",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // now for video section.
                  GestureDetector(
                    onTap: () {
                      // Navigate to PlayVideoPage when the video is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayVideoPage(
                            productModel: widget.productModel,
                          ), 
                        ),
                      );
                    },
                    child: _videoPlayerController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: Hero(
                              tag: widget.productModel.video,
                              child: VideoPlayer(_videoPlayerController),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    howToPouringCoffee,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
