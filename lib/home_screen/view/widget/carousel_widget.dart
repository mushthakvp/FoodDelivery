import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../viewmodel/carousel_image_pov.dart';

class Carouselwidget extends StatelessWidget {
  const Carouselwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<HomeCarouselPov>();
    return Consumer<HomeCarouselPov>(builder: (context, value, _) {
      return value.carouselList.isNotEmpty
          ? ImageSlideshow(
              indicatorColor: transparentColor,
              indicatorBackgroundColor: transparentColor,
              height: 170,
              autoPlayInterval: 4000,
              isLoop: true,
              children: List.generate(
                pov.carouselList.length,
                (index) {
                  final data = pov.carouselList[index];
                  return Container(
                    margin: const EdgeInsets.all(15),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data.productImage),
                        fit: BoxFit.cover,
                      ),
                      color: scafoldColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  );
                },
              ),
            )
          : const Center(child: CircularProgressIndicator());
    });
  }
}
