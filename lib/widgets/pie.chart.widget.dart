import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key, required this.data});
  final List<PieData> data;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCircularChart(
            title: ChartTitle(
                text: 'Asignaciones por estados'.toUpperCase(),
                textStyle: TextStyle(color: Colors.white)),
            legend: Legend(isVisible: true),
            series: <PieSeries<PieData, String>>[
          PieSeries<PieData, String>(
              // animationDelay: 10,
              legendIconType: LegendIconType.pentagon,
              explode: true,
              explodeIndex: 0,
              dataSource: data,
              xValueMapper: (PieData data, _) => data.xData,
              yValueMapper: (PieData data, _) => data.yData,
              dataLabelMapper: (PieData data, _) => data.text,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ]));
  }
}

class PieData {
  PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
