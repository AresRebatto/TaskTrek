import 'package:flutter/material.dart';
import 'package:task_trek/StopWatchTime.dart';

import '../Colori.dart';
import 'StandardWidgets.dart';
import 'package:task_trek/DataBase.dart';

class AnalyticsPage extends StatelessWidget
{
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar("Analytics"),
        body: Stack(
            children: [
              Container(
                  color: Colori.cream,
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 20.0, left: 10.0),
                        child: Column(
                          children: [
                            const Text(
                              "Tempo di concentrazione totale: ",
                                textAlign: TextAlign.left,
                            ),
                            Text(
                              StopWatchTime.ConcentrazioneTotale(),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        )
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 20.0, left: 10.0),
                          child: Column(
                            children: [
                              const Text(
                                "Tempo di concentrazione medio: ",
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                StopWatchTime.ConcentrazioneMedia(),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          )
                      )
                    ],
                  )

              ),
              StdBottomNavBar("analytics", context),
            ]
        )
    );
  }


}