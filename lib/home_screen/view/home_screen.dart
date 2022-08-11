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
        backgroundColor: blackColor
        ,
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
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                width: 160,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Image.network(
                          'https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Fresh Basil',
                              style: gFontsOleo(
                                fw: FontWeight.bold,
                              ),
                            ),
                            const Text('Fresh Basil'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
