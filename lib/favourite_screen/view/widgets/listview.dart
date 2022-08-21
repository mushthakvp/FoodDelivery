import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../home_screen/model/home_model.dart';
import '../../viewmodel/favourite_pov.dart';
import 'favorite_ratings.dart';

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({
    Key? key,
    required this.data,
    required this.id,
  }) : super(key: key);
  final String id;
  final HomeProductModel data;

  @override
  Widget build(BuildContext context) {
    final pov = context.read<FavouritePov>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200,
              width: 190,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.only(bottom: 10),
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
                        fw: FontWeight.w500,
                      ),
                    ),
                  ),
                  FavouriteRatingWidget(data: data),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'MRP ',
                          style: gFontsOleo(cl: whiteColor, sz: 14),
                        ),
                        Text(
                          "₹ ${data.productOffer}",
                          style: gFontsOleo(cl: whiteColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            log('message');
                            pov.deleteFavourite(id: id);
                          },
                          child: Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: greyColor.withOpacity(.2),
                              ),
                            ),
                            child: const Icon(
                              Icons.delete_outline,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: greyColor.withOpacity(.2),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Add To Bag',
                                  style: gFontsOleo(cl: whiteColor),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -210,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
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
            ),
          ],
        ),
      ],
    );
  }
}
