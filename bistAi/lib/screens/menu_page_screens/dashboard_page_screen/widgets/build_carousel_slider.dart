import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'image_widgets.dart';

class BuildCarouselSlider extends StatelessWidget {
  const BuildCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: (imageWidgets.length / 4).ceil(),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        int startIndex = index * 4;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
                (i) {
              int imageIndex = startIndex + i;
              if (imageIndex < imageWidgets.length) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: imageWidgets[imageIndex],
                    ),
                  ),
                );
              } else {
                return const Spacer();
              }
            },
          ),
        );
      },
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
    );
  }
}
