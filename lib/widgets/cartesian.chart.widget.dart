import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatefulWidget {
  const CartesianChart({super.key, required this.data});
  final List<ChartData> data;
  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        tooltipBehavior: _tooltip,
        backgroundColor: Colors.white,
        series: <ChartSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
              dataSource: widget.data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'DETALLES DE LA ASIGNACION',
              color: Colors.blue)
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
