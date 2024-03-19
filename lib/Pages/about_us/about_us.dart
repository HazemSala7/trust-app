import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:well_app_flutter/Constants/constants.dart';
import 'package:well_app_flutter/Server/functions/functions.dart';
import 'package:well_app_flutter/main.dart';
import '../../Components/app_bar_widget/app_bar_widget.dart';
import '../../Components/bottom_bar_widget/bottom_bar_widget.dart';
import '../../Components/drawer_widget/drawer_widget.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  int _currentIndex = 0;
  bool isTablet = false;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  Widget build(BuildContext context) {
    return Container(
      color: MAIN_COLOR,
      child: SafeArea(
        child: Scaffold(
          // bottomNavigationBar: BottomBarWidget(currentIndex: _currentIndex),
          key: _scaffoldState,
          drawer: DrawerWell(
            Refresh: () {
              setState(() {});
            },
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              isTablet = true;
            } else {
              isTablet = false;
            }
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  color: MAIN_COLOR,
                  child: Center(
                    child: Image.asset("assets/images/logo-trust.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    AppLocalizations.of(context)!.about_well,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder(
                      future: getAboutUs(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return AboutUsContent("");
                        } else {
                          if (snapshot.data != null) {
                            return AboutUsContent(locale.toString() == "ar"
                                ? snapshot.data["translations"][0]["value"]
                                : snapshot.data["body"]);
                          } else {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: double.infinity,
                              color: Colors.white,
                            );
                          }
                        }
                      }),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget AboutUsContent(var _htmlContent) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          locale.toString() == "ar"
              ? "مع بداية كل موسم تطلق شركة ويل انترناشونال مجموعة من الفرش المنزلي تم تصميمها خصيصا لك من قبل مصممينا في عدة دول مصنوعة من مواد فائقة الجودة لتناسب مجموعة واسعة من البيوت ذات التصاميم الحديثة والتقليدية شركة ويل توزع منتجاتها على العديد من المواقع باستمرار ملتزمة بتقديم تصاميم متميزة وابتكار لانهائي مع تجربة استثنائية لعملائنا."
              : "With the start of every season, Well International Company launches a new collection of home textiles. Designed and produced for you by our stylists in many countries with high quality materials to fit a wide spectrum of homes from traditional to modern. Well International Co. distributes it&rsquo;s products to many locations, constantly committed to deliver outstanding value, continuous innovation and exceptional customer experience.",
          style: TextStyle(
              fontSize: isTablet ? 25 : 16, fontWeight: FontWeight.bold),
        )
        // Html(
        //   data: _htmlContent,
        //   style: {
        //     // p tag with text_size
        //     "p": Style(
        //       fontSize: isTablet ? FontSize(25) : FontSize(16),
        //     ),
        //     "span": Style(
        //         fontSize: isTablet ? FontSize(25) : FontSize(16),
        //         fontFamily: 'Tajawal'),
        //   },
        // )
        );
  }
}
