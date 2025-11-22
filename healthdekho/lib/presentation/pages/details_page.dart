import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthdekho/presentation/controllers/health_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = Get.arguments;
    final controller = Get.find<HealthController>();
    final metric = controller.getMetricDetails(name);

    return Scaffold(
      appBar: AppBar(title: Text(metric.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${metric.value} ${metric.unit}",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        metric.history.length,
                        (i) => FlSpot(i.toDouble(), metric.history[i]),
                      ),
                      isCurved: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
