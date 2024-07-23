import 'package:cryptofolio/services/api.dart';
import 'package:get/get.dart';

Future<void> registerServices() async {
  Get.put(ApiService());
}
