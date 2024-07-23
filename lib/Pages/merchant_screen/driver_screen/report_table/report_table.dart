import 'package:flutter/material.dart';
import 'package:well_app_flutter/Components/loading_widget/loading_widget.dart';
import 'package:well_app_flutter/Pages/merchant_screen/driver_screen/report_table/table_row_card/table_row_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Constants/constants.dart';
import '../../../../Server/functions/functions.dart';

class ReportTable extends StatefulWidget {
  const ReportTable({super.key});

  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MAIN_COLOR,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: MAIN_COLOR,
          title: Text(
            AppLocalizations.of(context)!.maintenance_requests_report,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: getRequestsReports(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingWidget(heightLoading: 150);
                  } else {
                    if (snapshot.data != null) {
                      var reports = snapshot.data["data"];

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 40,
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color.fromRGBO(83, 89, 219, 1),
                                              Color.fromRGBO(32, 39, 160, 0.6),
                                            ]),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .country,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color.fromRGBO(83, 89, 219, 1),
                                              Color.fromRGBO(32, 39, 160, 0.6),
                                            ]),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .waiting_for_delivery_for_maintenance,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color.fromRGBO(83, 89, 219, 1),
                                              Color.fromRGBO(32, 39, 160, 0.6),
                                            ]),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .maintenance_done,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color.fromRGBO(83, 89, 219, 1),
                                              Color.fromRGBO(32, 39, 160, 0.6),
                                            ]),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .under_maintenance,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: reports.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TableRowCard(
                                  index: index,
                                  doneCount: reports[index]["doneCount"] ?? 0,
                                  pendingCount:
                                      reports[index]["pendingCount"] ?? 0,
                                  inProgressCount:
                                      reports[index]["inProgressCount"] ?? 0,
                                  countryName:
                                      reports[index]["countryName"] ?? "-",
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator()));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
