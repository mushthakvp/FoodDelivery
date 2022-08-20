import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:provider/provider.dart';
import '../../core/color/colors.dart';
import '../model/view_all_model.dart';
import '../viewmodel/view_provider.dart';
import '../viewmodel/viewmodel_provider.dart';
import 'widget/allitems_card.dart';
import 'widget/custom_serch_widget.dart';

class ViewAllScreen extends StatelessWidget {
  final String collection;
  const ViewAllScreen({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Consumer<ViewAllPov>(
            builder: (context, value, _) {
              return value.searchValue
                  ? AppBar(
                      title: Text(
                        'View All',
                        style: gFontsOleo(cl: whiteColor, sz: 22),
                      ),
                      backgroundColor: cardColor,
                      actions: [
                        IconButton(
                          splashRadius: 26,
                          onPressed: () {
                            value.searchValueChange(false);
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ],
                    )
                  : const CustomSearchWidget();
            },
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(collection).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            List<ViewAllProductModel> list = ViewAllModelPov.convertToList(streamSnapshot);
            return GridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              childAspectRatio: 1 / 1.58,
              children: List.generate(
                list.length,
                (index) {
                  // final id = streamSnapshot.data!.docs[index];
                  final data = list[index];
                  return ViewAllItemsCard(data: data);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
