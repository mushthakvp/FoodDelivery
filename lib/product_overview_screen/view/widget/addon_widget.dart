import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../core/styles/images.dart';
import '../../viewmodel/addon_provider.dart';

class AddOnWidget extends StatelessWidget {
  const AddOnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(sauseImage),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Sauce',
            style: gFontsOleo(cl: whiteColor, sz: 20),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '₹ 10',
              style: gFontsOleo(
                cl: whiteColor,
              ),
            ),
          ),
          Consumer<AddOnProductPov>(builder: (context, value, _) {
            return GestureDetector(
              onTap: () {
                value.buttonColorChange(value.changeValue ? false : true, context);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: value.buttonColor,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}
