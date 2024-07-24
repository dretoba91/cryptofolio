// import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/controller/assets_controlller.dart';
import 'package:cryptofolio/services/api.dart';
import 'package:get/get.dart';

Future<void> registerServices() async {
  Get.put(ApiService());
}

Future<void> registerControllers() async {
  Get.put(AssetsController());
  // Get.put(AddAssetsController());
}
