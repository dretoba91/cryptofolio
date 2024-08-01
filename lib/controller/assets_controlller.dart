import 'dart:convert';
import 'dart:developer';

import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/models/added_asset.dart';
import 'package:cryptofolio/models/crypto_currencies_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssetsController extends GetxController {
  RxList<AddedAsset> addedAssets = <AddedAsset>[].obs;
  AddAssetsController addAssetsController = Get.put(AddAssetsController());

  @override
  void onInit() {
    super.onInit();

    _loadSavedAssetsFromStorage();
  }

  void addNewAsset(String name, double amount) async {
    final assetPrice = getAssetPrice(name);
    final usdValue = assetPrice * amount;

    addedAssets.add(
      AddedAsset(
        name: name,
        amount: amount,
        usdValue: usdValue,
      ),
    );

    // saving asset into local storage using share_preference
    List<String> savedData =
        addedAssets.map((asset) => jsonEncode(asset)).toList();
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('added_assets', savedData);
  }

  // Load saved assets from local storage
  void _loadSavedAssetsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    List<String>? assets = prefs.getStringList('added_assets');

    if (assets != null) {
      addedAssets.value = assets
          .map((asset) => AddedAsset.fromJson(jsonDecode(asset)))
          .toList();
    }
  }

  double getTotalAssets() {
    if (addAssetsController.coinData.isEmpty) {
      return 0;
    }
    if (addedAssets.isEmpty) {
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
