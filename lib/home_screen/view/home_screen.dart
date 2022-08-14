import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view/widget/carousel_widget.dart';
import 'package:food_delivery/home_screen/viewmodel/home_pov.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final pov = context.read<HomePov>();
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        title: const Text('Pizza Pedler'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_on_outlined),
            splashRadius: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            splashRadius: 30,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CarouselWidget(),
          const ViewAllWidget(name: 'Pizza Mania'),
          const SizedBox(
            height: 20,
          ),
          LimitedBox(
            maxHeight: 290,
            child: Consumer<HomePov>(builder: (context, value, _) {
              return value.herbsProduct.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: value.herbsProduct.length,
                      itemBuilder: (context, index) {
                        final data = value.herbsProduct[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 230,
                                  width: 210,
                                  margin: const EdgeInsets.all(6),
                                  padding: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: whiteColor.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          data.productName,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: gFontsOleo(
                                            cl: whiteColor,
                                            fw: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      RatingBar.builder(
                                        itemSize: 20,
                                        initialRating: data.productRating.toDouble(),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        ignoreGestures: true,
                                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '30\nMin',
                                            textAlign: TextAlign.center,
                                            style: gFontsOleo(cl: greyColor, sz: 14),
                                          ),
                                          Column(
                                            children: List.generate(
                                              5,
                                              (index) => Container(
                                                height: 3,
                                                width: 3,
                                                margin: const EdgeInsets.only(bottom: 4),
                                                decoration: BoxDecoration(
                                                  color: greyColor,
                                                  borderRadius: BorderRadius.circular(2),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'MRP\n₹ ${data.productPrice}',
                                            style: gFontsOleo(cl: greyColor, sz: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )
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
                                        height: 110,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(data.productImage),
                                            fit: BoxFit.cover,
                                          ),
                                          color: scafoldColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                    // CircleAvatar(
                                    //   backgroundColor: transparentColor,
                                    //   backgroundImage: NetworkImage(data.productImage),
                                    //   radius: 60,
                                    // ),
                                    )
                              ],
                            ),
                          ],
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
          )
        ],
      ),
    );
  }
}

class ViewAllWidget extends StatelessWidget {
  final String name;
  const ViewAllWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: gFontsOleo(
              cl: whiteColor,
            ),
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
