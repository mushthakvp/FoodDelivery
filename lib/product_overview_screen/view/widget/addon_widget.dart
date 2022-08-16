import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../core/styles/images.dart';
import '../../viewmodel/addon_provider.dart';
import 'hotel_info_widget.dart';

class AddOnWidget extends StatelessWidget {
  final HomeProductModel data;
  const AddOnWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: gFontsOleo(cl: greyColor, fw: FontWeight.bold, sz: 18),
              ),
              const SizedBox(height: 5),
              Text(
                data.productDetails,
                style: gFontsOleo(cl: greyColor.withOpacity(.8)),
              )
            ],
          ),
        ),
        HotelInfoWidget(data: data),
      ],
    );
  }
}
