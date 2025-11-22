import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:healthdekho/data/models/health_metric_model.dart';

class LocalDataSource {
  // Local data source implementation
  Future<List<HealthMetricModel>> loadMetrics() async {
    // Simulate fetching data from a local database or file
    await Future.delayed(Duration(milliseconds: 200)); // Simulate delay


    // Load Json File
    final String raw = await rootBundle.loadString(
      'assets/data/health_metrics.json',
    );
    final data = json.decode(raw);

    // Convert the JSON data to a list of HealthMetricModel
    List<HealthMetricModel> metrics =
    (data["metrics"] as List).map((item) => HealthMetricModel.fromJson(item)).toList();

    return metrics;
  }
}


// Sample data
    // List<HealthMetricModel> metrics = [
    //   HealthMetricModel(
    //     name: "Blood Pressure",
    //     unit: "mmHg",
    //     value: 120.0,
    //     status: "Normal",
    //     range: "90-120 mmHg",
    //     historicalValues: [118.0, 121.0, 119.0],
    //   ),
    //   HealthMetricModel(
    //     name: "Heart Rate",
    //     unit: "bpm",
    //     value: 75.0,
    //     status: "Normal",
    //     range: "60-100 bpm",
    //     historicalValues: [72.0, 78.0, 74.0],
    //   ),
    // ];

