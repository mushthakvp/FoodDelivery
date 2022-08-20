import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/color/colors.dart';
import '../viewmodel/view_provider.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key, required String collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: cardColor,
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: greyColor.withOpacity(.3),
        ),
        width: double.infinity,
        child: const TextField(
          style: TextStyle(
            height: 1.3,
            color: Colors.white,
            letterSpacing: .8,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: greyColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
