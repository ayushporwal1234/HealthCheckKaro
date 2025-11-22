import 'package:get/get.dart';
import "package:healthdekho/data/datasources/local_data_source.dart";
import 'package:healthdekho/data/models/health_metric_model.dart';

// Controller to manage health metrics data
class HealthController extends GetxController {
  final LocalDataSource dataSource;

  // Constructor
  HealthController(this.dataSource);
  // Observable properties
  RxBool isLoading = true.obs;
  RxList<HealthMetricModel> metrics = <HealthMetricModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  // Method to load health metrics data
  Future<void> load() async {
    isLoading(true);
    metrics.value = await (dataSource as dynamic).loadMetrics();
    isLoading(false);
  }

  // Method to get details of a specific health metric by name
  HealthMetricModel getMetricDetails(String name) =>
      metrics.firstWhere((m) => m.name == name);
}
