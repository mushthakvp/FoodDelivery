import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/product_overview_screen/viewmodel/addon_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../home_screen/model/home_model.dart';
import 'info_widget.dart';

class AllInfoWidget extends StatelessWidget {
  const AllInfoWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final HomeProductModel data;

  @override
  Widget build(BuildContext context) {
    final pov = context.read<AddOnProductPov>();
    return Column(
      children: [
        const SizedBox(height: 8),
        const SizedBox(width: 40, child: Divider(color: whiteColor, thickness: 2)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            data.productName,
            textAlign: TextAlign.center,
            style: gFontsOleo(cl: whiteColor, sz: 25, fw: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Row(
            children: [
              Text(
                'MRP',
                style: gFontsOleo(cl: whiteColor, sz: 18),
              ),
              const SizedBox(width: 10),
              Visibility(
                visible: data.productPrice == data.productOffer ? false : true,
                child: Text(
                  '₹ ${data.productOffer}  ',
                  style: gFontsOleo(
                    fw: FontWeight.bold,
                    cl: whiteColor,
                    sz: 18,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '₹ ${data.productPrice}',
                style: data.productPrice != data.productOffer
                    ? gFontsOleo(
                        td: TextDecoration.lineThrough,
                        cl: greyColor,
                        sz: 18,
                        dcCl: blackColor,
                      )
                    : gFontsOleo(
                        cl: whiteColor,
                        sz: 18,
                      ),
              ),
              const SizedBox(width: 14),
              Visibility(
                visible: data.productPrice == data.productOffer ? false : true,
                child: Text(
                  '${pov.offerCalculating(
                    offerPrice: data.productOffer.toDouble(),
                    amount: data.productPrice.toDouble(),
                  )} %',
                  style: gFontsOleo(
                    fw: FontWeight.bold,
                    cl: greenColor,
                    sz: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const InfoWidget(
              icon: Icons.schedule,
              info: 'Cooking',
              time: '40 Minute',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: 3,
                  width: 3,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            const InfoWidget(
              icon: Icons.star,
              info: '4.08',
              time: 'Ratings',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: 3,
                  width: 3,
                  color: greyColor.withOpacity(.5),
                ),
              ),
            ),
            const InfoWidget(
              icon: FontAwesomeIcons.fire,
              info: 'Recommended',
              time: 'Top rated',
            ),
          ],
        )
      ],
    );
  }
}
