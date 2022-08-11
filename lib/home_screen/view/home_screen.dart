import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Home'),
        actions: const [
          CircleAvatar(
            backgroundColor: Color(0xFFDAD67C),
            child: Icon(
              Icons.search,
              size: 17,
              color: blackColor,
            ),
          ),
          CircleAvatar(
            backgroundColor: Color(0xFFDAD67C),
            child: Icon(
              Icons.shop,
              size: 17,
              color: blackColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://t4.ftcdn.net/jpg/01/43/88/31/360_F_143883132_bn9n14k3aX10bq5HN18IYHPbx9YyiSEA.jpg'),
                fit: BoxFit.cover,
              ),
              color: primaryColor,
              borderRadius: BorderRadius.circular(14),
            ),
          )
        ],
      ),
    );
  }
}
