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
        backgroundColor: blackColor,
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
                height: 220,
                width: 160,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Image.network(
                          'https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fresh Basil',
                              style: gFontsOleo(
                                fw: FontWeight.bold,
                              ),
                            ),
                            const Text('50\$/50 Gram'),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 29,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: greyColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    height: 29,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: greyColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
