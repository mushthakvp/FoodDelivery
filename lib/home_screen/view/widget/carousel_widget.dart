import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/viewmodel/carousel_image_pov.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeCarouselPov>(
      builder: (context, value, child) {
        return value.carouselList.isNotEmpty
            ? Container(
                margin: const EdgeInsets.all(10),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(value.carouselList.first.productImage),
                    fit: BoxFit.cover,
                  ),
                  color: scafoldColor,
                  borderRadius: BorderRadius.circular(14),
                ),
              )
            : const CupertinoActivityIndicator();
      },
    );
  }
}
