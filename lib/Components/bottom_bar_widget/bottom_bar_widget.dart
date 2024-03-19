import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:well_app_flutter/Pages/home_screen/home_screen.dart';
import 'package:well_app_flutter/Pages/new_products/new_products.dart';
import 'package:well_app_flutter/Pages/offers/offers.dart';
import '../../Constants/constants.dart';

List<Widget> _pages = [MainScreen(), NewProducts(), Offers()];

class BottomBarWidget extends StatefulWidget {
  int currentIndex = 0;
  BottomBarWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      notchMargin: 0,
      height: 55,
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        child: Container(
          width: double.infinity,
          child: BottomNavigationBar(
              currentIndex: widget.currentIndex,
              backgroundColor: Color(0xffECECEC),
              selectedItemColor: MAIN_COLOR,
              onTap: (index) {
                setState(() {
                  widget.currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: AppLocalizations.of(context)!.home),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 0,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/offers_grey.png"),
                    ),
                    label: AppLocalizations.of(context)!.offer)
              ]),
        ),
      ),
    );
  }
}
