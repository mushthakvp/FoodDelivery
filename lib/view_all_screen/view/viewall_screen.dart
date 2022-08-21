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
import 'widget/search_all_items.dart';

class ViewAllScreen extends StatelessWidget {
  final String collection;
  const ViewAllScreen({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<ViewAllModelPov>();
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
        body: Consumer<ViewAllPov>(builder: (context, value, _) {
          return value.searchResult.isNotEmpty
              ? GridView.count(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1 / 1.35,
                  children: List.generate(
                    value.searchResult.length,
                    (index) {
                      // final id = streamSnapshot.data!.docs[index];
                      final data = value.searchResult[index];
                      return SearchAllItemsCard(data: data);
                    },
                  ),
                )
              : value.initSearching
                  ? StreamBuilder(
                      stream: FirebaseFirestore.instance.collection(collection).snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        List<ViewAllProductModel> list = pov.convertToList(streamSnapshot);
                        return GridView.count(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          childAspectRatio: 1 / 1.35,
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
                    )
                  : Center(
                      child: Text(
                        'no data',
                        style: gFontsOleo(cl: whiteColor),
                      ),
                    );
        }),
      ),
    );
  }
}
