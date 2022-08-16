import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/view/widget/satar_rating_widget.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../model/home_model.dart';

class HomeScreenItemsCard extends StatelessWidget {
  const HomeScreenItemsCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final HomeProductModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 185,
              width: 180,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      data.productName,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: gFontsOleo(
                        cl: whiteColor,
                        fw: FontWeight.w600,
                      ),
                    ),
                  ),
                  StarRatingWidget(data: data),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '30\nMin',
                        textAlign: TextAlign.center,
                        style: gFontsOleo(cl: greyColor, sz: 14),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => Container(
                            height: 3,
                            width: 3,
                            margin: const EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'MRP\n₹ ${data.productPrice}',
                        style: gFontsOleo(cl: greyColor, sz: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: -210,
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Center(
                  child: Hero(
                    tag: data.productName,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data.productImage),
                          fit: BoxFit.cover,
                        ),
                        color: scafoldColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
