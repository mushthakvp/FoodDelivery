import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../viewmodel/view_provider.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<ViewAllPov>();
    return AppBar(
      leading: IconButton(
        splashRadius: 26,
        onPressed: () {
          pov.appLeadingTap();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: cardColor,
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: greyColor.withOpacity(.3),
        ),
        width: double.infinity,
        child: TextField(
          controller: pov.searchController,
          style: const TextStyle(
            height: 1.3,
            color: Colors.white,
            letterSpacing: .8,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Consumer<ViewAllPov>(
              builder: (context, value, _) {
                return Visibility(
                  visible: value.searchValueChecking,
                  child: IconButton(
                    onPressed: () {
                      pov.appLeadingTap();
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      color: whiteColor,
                    ),
                  ),
                );
              },
            ),
            hintText: 'Search',
            hintStyle: const TextStyle(
              color: greyColor,
              fontSize: 16,
            ),
          ),
          onChanged: (String data) {
            pov.searchFilter(query: data, context: context);
            pov.changeSearchValues(data.trim());
          },
        ),
      ),
    );
  }
}
