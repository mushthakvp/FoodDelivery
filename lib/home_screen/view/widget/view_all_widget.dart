import 'package:flutter/material.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/view_all_screen/view/viewall_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../view_all_screen/viewmodel/view_provider.dart';

class ViewAllWidget extends StatelessWidget {
  final String name;
  final String collection;
  const ViewAllWidget({Key? key, required this.name, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<ViewAllPov>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: gFontsOleo(cl: whiteColor, fw: FontWeight.bold, ls: 1),
          ),
          GestureDetector(
            onTap: () {
              pov.searchValueChange(true);
              Routes.push(screen: ViewAllScreen(collection: collection));
            },
            child: Text(
              'VIEW ALL',
              style: gFontsOleo(cl: greyColor, sz: 14),
            ),
          ),
        ],
      ),
    );
  }
}
