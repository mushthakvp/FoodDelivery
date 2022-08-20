import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/color/colors.dart';
import '../viewmodel/view_provider.dart';
import 'widget/custom_serch_widget.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key, required String collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scafoldColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Consumer<ViewAllPov>(builder: (context, value, _) {
            return value.searchValue
                ? AppBar(
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
          }),
        ),
      ),
    );
  }
}
