import 'dart:developer';

import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/models/added_asset.dart';
import 'package:cryptofolio/models/crypto_currencies_data.dart';
import 'package:get/get.dart';

class AssetsController extends GetxController {
  RxList<AddedAsset> addedAssets = <AddedAsset>[].obs;
  AddAssetsController addAssetsController = Get.put(AddAssetsController());

  @override
  void onInit() {
    super.onInit();

    // addAssetsController.fetchAssets();
  }

  void addNewAsset(String name, double amount) {
    addedAssets.add(AddedAsset(
      name: name,
      amount: amount,
    ));
    print("new asset: ${addedAssets}");
  }

  double getTotalAssets() {
    if (addAssetsController.coinData.isEmpty) {
      log("checking if addedAssetsController coin data is empty");
      return 0;
    }
    if (addedAssets.isEmpty) {
      log("checking if added assets is empty");
      return 0;
    }
    double value = 0;
    for (AddedAsset asset in addedAssets) {
      value += getAssetPrice(asset.name!) * asset.amount!;
    }
    return value;
  }

  double getAssetPrice(String assetName) {
    CryptoCurrenciesData? data = getCoinData(assetName);
    return data?.values?.uSD?.price?.toDouble() ?? 0;
  }

  CryptoCurrenciesData? getCoinData(String name) {
    return addAssetsController.coinData.firstWhereOrNull((e) => e.name == name);
  }
}
