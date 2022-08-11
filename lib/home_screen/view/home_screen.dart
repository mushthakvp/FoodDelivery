import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view/widget/carousel_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldColor,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Home'),
        actions: const [
          CircleAvatar(
            backgroundColor: Color(0xFFDAD67C),
            child: Icon(
              Icons.search,
              size: 17,
              color: blackColor,
            ),
          ),
          SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: Color(0xFFDAD67C),
            child: Icon(
              Icons.shop,
              size: 17,
              color: blackColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const CarouselWidget(),
          const ViewAllWidget(),
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: 160,
                decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Herbs Seasonings',
            style: gFontsOleo(),
          ),
          Text(
            'view all',
            style: gFontsOleo(cl: greyColor),
          ),
        ],
      ),
    );
  }
}
