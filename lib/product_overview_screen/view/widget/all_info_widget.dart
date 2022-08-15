import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              info: 'Cooking',
              time: '40 Minute',
            ),
          ],
        )
      ],
    );
  }
}
