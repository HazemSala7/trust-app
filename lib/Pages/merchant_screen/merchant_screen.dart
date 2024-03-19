import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:well_app_flutter/Components/button_widget/button_widget.dart';
import 'package:well_app_flutter/Constants/constants.dart';
import 'package:well_app_flutter/Pages/authentication/register_screen/register_screen.dart';
import 'package:well_app_flutter/Server/functions/functions.dart';

import '../../../Components/loading_widget/loading_widget.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({super.key});

  @override
  State<MerchantScreen> createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MAIN_COLOR,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    child: Center(
                      child: Image.asset(
                        'assets/images/trust-red.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35, left: 35),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ButtonWidget(
                              name: AppLocalizations.of(context)!
                                  .warranty_inspection,
                              height: 50,
                              width: double.infinity,
                              BorderColor: Color(0xffEBEBEB),
                              FontSize: 16,
                              OnClickFunction: () {},
                              BorderRaduis: 40,
                              ButtonColor: Color(0xffEBEBEB),
                              NameColor: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ButtonWidget(
                              name: AppLocalizations.of(context)!
                                  .amending_the_warranty,
                              height: 50,
                              width: double.infinity,
                              BorderColor: Color(0xffEBEBEB),
                              FontSize: 16,
                              OnClickFunction: () {},
                              BorderRaduis: 40,
                              ButtonColor: Color(0xffEBEBEB),
                              NameColor: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ButtonWidget(
                              name: AppLocalizations.of(context)!
                                  .send_to_maintenance,
                              height: 50,
                              width: double.infinity,
                              BorderColor: Color(0xffEBEBEB),
                              FontSize: 16,
                              OnClickFunction: () {},
                              BorderRaduis: 40,
                              ButtonColor: Color(0xffEBEBEB),
                              NameColor: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ButtonWidget(
                              name: AppLocalizations.of(context)!
                                  .maintenance_status,
                              height: 50,
                              width: double.infinity,
                              BorderColor: Color(0xffEBEBEB),
                              FontSize: 16,
                              OnClickFunction: () {},
                              BorderRaduis: 40,
                              ButtonColor: Color(0xffEBEBEB),
                              NameColor: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ButtonWidget(
                              name: AppLocalizations.of(context)!
                                  .inquire_about_product_specifications,
                              height: 50,
                              width: double.infinity,
                              BorderColor: Color(0xffEBEBEB),
                              FontSize: 16,
                              OnClickFunction: () {},
                              BorderRaduis: 40,
                              ButtonColor: Color(0xffEBEBEB),
                              NameColor: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ButtonWidget(
                              name: AppLocalizations.of(context)!
                                  .effective_guarantees,
                              height: 50,
                              width: double.infinity,
                              BorderColor: Color(0xffEBEBEB),
                              FontSize: 16,
                              OnClickFunction: () {},
                              BorderRaduis: 40,
                              ButtonColor: Color(0xffEBEBEB),
                              NameColor: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: ButtonWidget(
                              name: AppLocalizations.of(context)!.logout,
                              height: 50,
                              width: double.infinity,
                              BorderColor: MAIN_COLOR,
                              FontSize: 16,
                              OnClickFunction: () {},
                              BorderRaduis: 40,
                              ButtonColor: MAIN_COLOR,
                              NameColor: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
