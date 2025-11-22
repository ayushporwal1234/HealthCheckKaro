import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthdekho/data/datasources/local_data_source.dart';
import 'package:healthdekho/presentation/controllers/health_controller.dart';
import 'package:healthdekho/presentation/widgets/metric_card.dart';

import '../controllers/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HealthController(LocalDataSource()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Health Dekho'),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
              Get.find<ThemeController>().isDark.value  // check value
                  ? Icons.dark_mode
                  : Icons.light_mode,
            )),
            onPressed: () {
              Get.find<ThemeController>().toggleTheme();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: controller.metrics.length,
          itemBuilder: (context, index) {
            final metric = controller.metrics[index];
            return MetricCard(metric: controller.metrics[index]);
          },
        );
      }),
    );
  }
}
