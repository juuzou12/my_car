import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';


class pie_chart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfCircularChart(
        series: <CircularSeries>[
          RadialBarSeries<ChartData, String>(
              dataSource: _chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Radius of the radial bar
              radius: '80%',gap: "8%",
              cornerStyle: CornerStyle.bothCurve,
              dataLabelSettings: DataLabelSettings(
                // Renders the data label
                isVisible: false,

              )
          )
        ],
        legend: Legend(
            isVisible: true,
            iconHeight: 20,
            iconWidth: 20,
            overflowMode: LegendItemOverflowMode.wrap),
      ),
      height: 200,
    );
  }

  List<ChartData> chartData(var snapshot ){
    return List.generate(4, (i) {
      final isTouched = i == -1;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return ChartData("Complete visits", 5.0,Colors.purple);
        case 1:
          return ChartData("Cancelled requests", 2.0,Colors.blue);
        case 2:
          return ChartData("In-progress", 1.0,Colors.orange);
        default:
          throw Error();
      }
    });
  }
  final List<ChartData> _chartData = [
    ChartData('Complete visits', 25,Colors.purple),
    ChartData('Cancelled requests', 35,Colors.blue),
    ChartData('In-progress', 40,Colors.orange),
  ];
}
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
