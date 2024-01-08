import 'package:flutter/material.dart';
import 'package:task_trek/StopWatchTime.dart';
import 'package:fl_chart/fl_chart.dart';
import '../Colori.dart';
import 'StandardWidgets.dart';
import 'package:task_trek/DataBase.dart';
import 'package:task_trek/ChatsData.dart';
import 'dart:math' as math;
import 'package:task_trek/Task.dart';

class AnalyticsPage extends StatefulWidget
{
  //const AnalyticsPage({super.key});

  @override
  State<StatefulWidget> createState() => AnalyticsPageState();
  
}

class AnalyticsPageState extends State<AnalyticsPage>
{
  final List<ChartData> frstChartData = [];
  final List<FlSpot> scndChartData = [];
  @override
  Widget build(BuildContext context) {
    for(var task in DBApp.taskList)
    {
      frstChartData.add(ChartData(task.Nome, task.SumTaskTimes()));
    }

    for(int i = 6; i >= 0; i--){
      scndChartData.add(FlSpot((i+1).toDouble(), (Task.SumTasksTimeFromDate(DateTime.now().subtract(Duration(days: 6-i)))*math.pow(10, 1)).round()/math.pow(10, 1)));
    }
    if(scndChartData.isEmpty){print("La lista dei dati è vuota");}
    return Scaffold(
      backgroundColor: Colori.cream,
      appBar: GeneralAppBar("Analytics"),
        body: Stack(
            children: [
              Container(
                  height: 635,
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Text(
                          "Attività svolte",
                          style: TextStyle(
                            color: Colori.darkBrown,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      ),
                      if(frstChartData.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          height: 200,
                          width: 200,
                          child: PieChart(
                            PieChartData(
                              sections: [
                                for(var elements in frstChartData)
                                  PieChartSectionData(
                                    value: elements.dataValue,
                                    title: elements.dataName,
                                    showTitle: true,
                                    radius: 100,
                                    color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
                                  )
                              ]
                            )
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Text(
                          "Tempo di attività giornaliera",
                          style: TextStyle(
                              color: Colori.darkBrown,
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),
                        ),
                      ),
                      if(scndChartData.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          height: 250,
                          width: 200,
                          child: LineChart(
                            LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                  spots: scndChartData,
                                )
                              ]
                            )
                          ),
                        ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 20.0, left: 10.0),
                        child: Column(
                          children: [
                            Text(
                              "Tempo di concentrazione totale: ",
                              style: TextStyle(
                                  color: Colori.darkBrown,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),
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
                              Text(
                                "Tempo di concentrazione medio: ",
                                textAlign: TextAlign.left,
                                 style: TextStyle(
                                     color: Colori.darkBrown,
                                     fontWeight: FontWeight.w600,
                                     fontSize: 15
                                 ),
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

