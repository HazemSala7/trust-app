import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:well_app_flutter/Components/button_widget/button_widget.dart';
import 'package:well_app_flutter/Constants/constants.dart';
import 'package:well_app_flutter/Pages/authentication/register_screen/register_screen.dart';
import 'package:well_app_flutter/Pages/merchant_screen/merchant_screen.dart';
import 'package:well_app_flutter/Server/functions/functions.dart';

import '../../../Components/loading_widget/loading_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
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
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50, left: 50),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(101, 230, 229, 229),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xffEBEBEB),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: TextField(
                                controller: EmailController,
                                obscureText: false,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 10, top: 12),
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 85, 84, 84),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  border: InputBorder.none,
                                  hintText: AppLocalizations.of(context)!
                                      .contact_email,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 2),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xffEBEBEB),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: TextField(
                                controller: PasswordController,
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 10, top: 12),
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 85, 84, 84),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  border: InputBorder.none,
                                  hintText: AppLocalizations.of(context)!
                                      .password_my_account,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 25),
                              child: ButtonWidget(
                                  name: AppLocalizations.of(context)!.login,
                                  FontSize: 18,
                                  height: 40.0,
                                  width: 130,
                                  BorderColor: MAIN_COLOR,
                                  OnClickFunction: () {
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) {
                                    //     return AlertDialog(
                                    //       content: SizedBox(
                                    //         height: 60,
                                    //         width: 60,
                                    //         child: Row(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.spaceAround,
                                    //           children: [
                                    //             SpinKitFadingCircle(
                                    //               color: Colors.black,
                                    //               size: 40.0,
                                    //             ),
                                    //             Text(
                                    //               "Loggin you in",
                                    //               style: TextStyle(
                                    //                   fontWeight:
                                    //                       FontWeight.bold,
                                    //                   fontSize: 16),
                                    //             )
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     );
                                    //   },
                                    // );
                                    // sendLoginRequest(EmailController.text,
                                    //     PasswordController.text, context);
                                    NavigatorFunction(
                                        context, MerchantScreen());
                                  },
                                  BorderRaduis: 20,
                                  ButtonColor: MAIN_COLOR,
                                  NameColor: Colors.white)),
                        ],
                      ),
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
