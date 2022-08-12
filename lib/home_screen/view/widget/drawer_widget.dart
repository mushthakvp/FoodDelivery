import 'package:flutter/material.dart';
import '../../../core/color/colors.dart';
import '../../../profile_screen/view/profile_screen.dart';
import '../../../routes/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 43,
                  child: CircleAvatar(
                    backgroundColor: blackColor,
                    radius: 40,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
              color: scafoldColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () => Routes.push(screen: const ProfileScreen()),
                  title: const Text('Profile'),
                  subtitle: const Text('Click here'),
                  leading: const Icon(Icons.person),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
