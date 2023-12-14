import 'package:flutter/material.dart';

import '../Colori.dart';
import 'StandardWidgets.dart';

class AnalyticsPage extends StatelessWidget
{
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Container(
                  color: Colori.cream,
                  child: ListView(
                    children: [
                    ],
                  )

              ),
              StdBottomNavBar("analytics", context),
            ]
        )
    );
  }

}