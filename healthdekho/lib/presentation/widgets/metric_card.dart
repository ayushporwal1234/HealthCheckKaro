import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthdekho/data/models/health_metric_model.dart';

class MetricCard extends StatelessWidget {
  final HealthMetricModel metric;

  const MetricCard({super.key, required this.metric});

  Color getStatusColor() {
    switch (metric.status) {
      case "low":
        return Colors.red.shade100;
      case "high":
        return Colors.orange.shade100;
      default:
        return Colors.green.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/details', arguments: metric.name),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: getStatusColor(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              metric.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              "${metric.value} ${metric.unit}",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Text("Status: ${metric.status.toUpperCase()}", style: TextStyle(color: Colors.grey),),
            SizedBox(height: 4),
            Text(
              "Normal Range: ${metric.range}",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
