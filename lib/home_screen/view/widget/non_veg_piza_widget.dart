import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/view/widget/home_screenitems.dart';
import 'package:food_delivery/product_overview_screen/viewmodel/addon_provider.dart';
import 'package:provider/provider.dart';
import '../../../product_overview_screen/view/product_overview_screen.dart';
import '../../../routes/routes.dart';
import '../../viewmodel/home_pov.dart';

class NonVegPizaWidget extends StatelessWidget {
  const NonVegPizaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<AddOnProductPov>();
    return LimitedBox(
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
