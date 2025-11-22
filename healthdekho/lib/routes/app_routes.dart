import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:healthdekho/presentation/pages/details_page.dart';
import 'package:healthdekho/presentation/pages/home_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/details', page: () => DetailPage()),
  ];
}
