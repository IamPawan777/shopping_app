import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:scapyard/pages/home.dart';
// import 'package:scapyard/pages/order.dart';
// import 'package:scapyard/pages/profile.dart';
// import 'package:scapyard/pages/wallet.dart';
import 'package:scrapyad/pages/home.dart';
import 'package:scrapyad/pages/order.dart';
import 'package:scrapyad/pages/profile.dart';
import 'package:scrapyad/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Order order;
  late Wallet wallet;
  late Profile profile;

  @override
  void initState() {
    homepage = Home();
    order = Order();
    wallet = Wallet();
    profile = Profile();
    pages = [homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 45,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(microseconds: 1200),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.wallet_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.person_outline,
          color: Colors.white,
        )
      ]),
      body: pages[currentTabIndex],
    );
  }
}
