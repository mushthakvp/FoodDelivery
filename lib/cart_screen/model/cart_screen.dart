import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/images.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        title: const Text('Bag'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(14),
            height: 215,
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 145,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(basil),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text('DENNIXLINGP PREMIUM ATTIRE'),
                        const Text('Good for healthy '),
                        const SizedBox(height: 10),
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyColor),
                          ),
                          child: const Center(
                            child: Text('Qty 1kg'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('\$50 ')
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: greyColor.withOpacity(.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(),
                      child: const Text('Remove'),
                    ),
                    const SizedBox(width: 10),
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
