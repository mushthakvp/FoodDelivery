import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/view/widget/home_screenitems.dart';
import 'package:food_delivery/product_overview_screen/viewmodel/addon_provider.dart';
import 'package:provider/provider.dart';
import '../../../product_overview_screen/view/product_overview_screen.dart';
import '../../../routes/routes.dart';
import '../../viewmodel/home_pov.dart';

class VegPizaWidget extends StatelessWidget {
  const VegPizaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<AddOnProductPov>();
    return LimitedBox(
      maxHeight: 252,
      child: Consumer<HomePov>(builder: (context, value, _) {
        return value.vegPiza.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: value.vegPiza.length,
                itemBuilder: (context, index) {
                  final data = value.vegPiza[index];
                  return GestureDetector(
                    onTap: () {
                      pov.buttonColorChange(false, context);
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
    );
  }
}
