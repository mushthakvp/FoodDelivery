import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/cartscreen/model/bag_models.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../product_overview_screen/view/product_overview_screen.dart';
import '../../viewmodel/counter_provider.dart';

class BagItemsWidget extends StatelessWidget {
  final BagModels data;
  const BagItemsWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(data.productBackdrop),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.productName,
                        maxLines: 2,
                        softWrap: true,
                        style: gFontsOleo(cl: whiteColor, sz: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹ ${data.productOffer}",
                            style: gFontsOleo(cl: whiteColor),
                          ),
                          Consumer<CounterPov>(builder: (context, value, _) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    value.removeProductQuantity(data);
                                  },
                                  child: const CounterWidget(
                                    icon: Icons.remove,
                                    radius: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    '${data.productCount}',
                                    style: gFontsOleo(cl: whiteColor),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    value.addProductQuantity(data);
                                  },
                                  child: const CounterWidget(
                                    iconSize: 16,
                                    icon: Icons.add,
                                    radius: 20,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(color: greyColor.withOpacity(.3)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'InStock',
                  style: gFontsOleo(cl: greenColor),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: greyColor.withOpacity(.1), // Text Color
                      ),
                      onPressed: () {},
                      child: Text(
                        'Moveto whishlist',
                        style: gFontsOleo(cl: whiteColor),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: greyColor.withOpacity(.1), // Text Color
                      ),
                      onPressed: () {},
                      child: Text(
                        'Remove',
                        style: gFontsOleo(cl: whiteColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
