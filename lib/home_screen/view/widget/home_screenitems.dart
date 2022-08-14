import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
              height: 230,
              width: 210,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  const SizedBox(height: 8),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: data.productRating.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
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
                    tag: data.productImage,
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
