import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_app_flutter/Pages/about_us/about_us.dart';
import 'package:well_app_flutter/Pages/authentication/login_screen/login_screen.dart';
import 'package:well_app_flutter/Pages/contact_us/contact_us.dart';
import 'package:well_app_flutter/Pages/home_screen/home_screen.dart';
import 'package:well_app_flutter/Pages/main_categories/main_categories.dart';
import 'package:well_app_flutter/Pages/merchant_screen/maintenance_requests/maintenance_requests.dart';
import 'package:well_app_flutter/Pages/merchant_screen/warranties/warranties.dart';
import 'package:well_app_flutter/Pages/my_account/my_account.dart';
import 'package:well_app_flutter/Pages/my_account/my_orders/my_orders.dart';
import 'package:well_app_flutter/Pages/wishlists/wishlists.dart';
import 'package:well_app_flutter/Server/functions/functions.dart';
import '../../Pages/merchant_screen/merchant_screen.dart';
import '../../Pages/point_of_sales/point_of_sales.dart';
import '../../main.dart';
import '../search_dialog/search_dialog.dart';

class DrawerWell extends StatefulWidget {
  Function Refresh;
  DrawerWell({
    Key? key,
    required this.Refresh,
  }) : super(key: key);

  @override
  State<DrawerWell> createState() => _DrawerWellState();
}

class _DrawerWellState extends State<DrawerWell> {
  @override
  bool LOGIN = false;
  String ROLEID = "";
  setControolers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? login = await prefs.getBool('login') ?? false;
    String? RoleID = await prefs.getString('role_id');
    if (login) {
      setState(() {
        LOGIN = true;
        ROLEID = RoleID.toString();
      });
    } else {
      setState(() {
        LOGIN = false;
        ROLEID = RoleID.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setControolers();
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: ListView(
        children: [
          Container(
            height: 100,
            width: 50,
            child: Center(
              child: Image.asset(
                'assets/images/logo-trust.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DrawerMethod(
              name: AppLocalizations.of(context)!.home,
              OnCLICK: () {
                NavigatorFunction(context, HomeScreen(currentIndex: 0));
              },
              icon: Icons.home,
              iconPath: "assets/images/home.svg"),
          DrawerMethod(
              name: AppLocalizations.of(context)!.product,
              OnCLICK: () {
                NavigatorFunction(context, MainCategories());
              },
              icon: Icons.category_sharp,
              iconPath: "assets/images/products.svg"),
          DrawerMethod(
              name: AppLocalizations.of(context)!.poin_of_sales,
              OnCLICK: () {
                NavigatorFunction(context, PointOfSales());
              },
              icon: Icons.category_sharp,
              iconPath: "assets/images/point_of_sales.svg"),
          Visibility(
            visible: ROLEID.toString() == "3" ? true : false,
            child: DrawerMethod(
                name: "الكفالات و الصيانة",
                OnCLICK: () {
                  NavigatorFunction(context, MerchantScreen());
                },
                icon: Icons.fmd_good,
                iconPath: "assets/images/maintences_warranties.svg"),
          ),
          DrawerMethod(
              name: AppLocalizations.of(context)!.contact,
              OnCLICK: () {
                NavigatorFunction(context, ContactUs());
              },
              icon: Icons.phone,
              iconPath: "assets/images/contact.svg"),
          DrawerMethod(
              name: AppLocalizations.of(context)!.who,
              OnCLICK: () {
                NavigatorFunction(context, AboutUs());
              },
              icon: Icons.question_mark,
              iconPath: "assets/images/about.svg"),
          DrawerMethod(
              name: AppLocalizations.of(context)!.search_drawer,
              OnCLICK: () {
                showSearchDialog(context);
              },
              icon: Icons.search,
              iconPath: "assets/images/search.svg"),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.white,
            ),
          ),
          Visibility(
            visible: LOGIN,
            child: DrawerMethod(
                name: AppLocalizations.of(context)!.my_account,
                OnCLICK: () {
                  NavigatorFunction(context, MyAccount());
                },
                icon: Icons.account_box,
                iconPath: "assets/images/account.svg"),
          ),
          DrawerMethod(
              name: AppLocalizations.of(context)!.favourite,
              OnCLICK: () {
                NavigatorFunction(context, Wishlists());
              },
              icon: Icons.favorite,
              iconPath: "assets/images/favorates.svg"),
          Visibility(
            visible: LOGIN,
            child: DrawerMethod(
                name: AppLocalizations.of(context)!.my_orders,
                OnCLICK: () {
                  NavigatorFunction(context, MyOrders());
                },
                icon: Icons.request_page,
                iconPath: "assets/images/orders.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.white,
            ),
          ),
          Visibility(
            visible: LOGIN ? false : true,
            child: DrawerMethod(
                name: AppLocalizations.of(context)!.login,
                OnCLICK: () {
                  NavigatorFunction(context, LoginScreen());
                },
                icon: Icons.login,
                iconPath: "assets/images/logout.svg"),
          ),
          // Visibility(
          //   visible: LOGIN ? false : true,
          //   child: DrawerMethod(
          //       name: AppLocalizations.of(context)!.create_account,
          //       OnCLICK: () {
          //         NavigatorFunction(context, RegisterScreen());
          //       },
          //       icon: Icons.app_registration),
          // ),
          Visibility(
            visible: LOGIN,
            child: DrawerMethod(
                name: AppLocalizations.of(context)!.logout,
                OnCLICK: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  NavigatorFunction(context, HomeScreen(currentIndex: 0));
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!.toastlogout,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                icon: Icons.logout,
                iconPath: "assets/images/logout.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    Trust.of(context)!
                        .setLocale(Locale.fromSubtags(languageCode: 'ar'));
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('language', "arabic");
                    widget.Refresh();
                  },
                  child: Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color.fromARGB(255, 99, 99, 99)),
                    child: Center(
                      child: Text(
                        "عربي",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Trust.of(context)!
                        .setLocale(Locale.fromSubtags(languageCode: 'en'));
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('language', "english");
                    widget.Refresh();
                  },
                  child: Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(255, 99, 99, 99)),
                    child: Center(
                      child: Text(
                        "English",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget DrawerMethod(
      {String name = "",
      String iconPath = "",
      IconData? icon,
      Function? OnCLICK}) {
    return InkWell(
      onTap: () {
        OnCLICK!();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(
            //   icon,
            //   color: Colors.white,
            //   size: 25,
            // ),
            SvgPicture.asset(
              iconPath,
              // color: Colors.black,
              fit: BoxFit.cover,
              width: 25,
              height: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
