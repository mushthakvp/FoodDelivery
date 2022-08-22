import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/color/colors.dart';
import '../../home_screen/viewmodel/bottom_barprovider.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<HomeBottomNavBar>(builder: (context, value, _) {
        return FlashyTabBar(
          backgroundColor: cardColor,
          selectedIndex: value.bottomIndex,
          showElevation: true,
          onItemSelected: (index) {
            value.changeBottomIndex(bottomIndex: index);
          },
          items: [
            FlashyTabBarItem(
              icon: const Icon(Icons.event),
              title: const Text('Events'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.search),
              title: const Text('Search'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.highlight),
              title: const Text('Highlights'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('한국어'),
            ),
          ],
        );
      }),
    );
  }
}
