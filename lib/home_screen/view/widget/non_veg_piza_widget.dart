import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/view/widget/home_screenitems.dart';
import 'package:provider/provider.dart';
import '../../../product_overview_screen/view/product_overview_screen.dart';
import '../../../product_overview_screen/viewmodel/addon_provider.dart';
import '../../../routes/routes.dart';
import '../../model/home_model.dart';
import '../../viewmodel/home_pov.dart';

class NonVegPizaWidget extends StatelessWidget {
  const NonVegPizaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<HomePov>();

    return LimitedBox(
      maxHeight: 252,
      child: StreamBuilder(
          stream: pov.nonVegCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            List<HomeProductModel> list = pov.convertToList(streamSnapshot);

            return streamSnapshot.hasData
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final id = streamSnapshot.data!.docs[index];
                      final data = list[index];

                      return GestureDetector(
                        onTap: () {
                          context.read<AddOnProductPov>().buttonColorChange(false, context);
                          Routes.push(
                            screen: ProductOverviewScreen(
                              data: data,
                              collection: 'nonVegPizza',
                              id: id.id,
                            ),
                          );
                        },
                        child: HomeScreenItemsCard(data: data),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
