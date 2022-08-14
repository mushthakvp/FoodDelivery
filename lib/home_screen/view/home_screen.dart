import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/home_screen/viewmodel/home_pov.dart';
import 'package:food_delivery/product_overview_screen/view/product_overview_screen.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:provider/provider.dart';
import 'widget/carousel_widget.dart';
import 'widget/home_screenitems.dart';
import 'widget/view_all_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: cardColor,
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
          const Carouselwidget(),
          const ViewAllWidget(name: 'Pizza Mania'),
          const SizedBox(
            height: 20,
          ),
          LimitedBox(
            maxHeight: 270,
            child: Consumer<HomePov>(builder: (context, value, _) {
              return value.herbsProduct.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: value.herbsProduct.length,
                      itemBuilder: (context, index) {
                        final data = value.herbsProduct[index];
                        return GestureDetector(
                          onTap: () {
                            Routes.push(
                              screen: ProductOverviewScreen(data: data),
                            );
                          },
                          child: HomeScreenItemsCard(data: data),
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
