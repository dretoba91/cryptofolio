import 'dart:developer';

import 'package:cryptofolio/models/api_data_response.dart';
import 'package:cryptofolio/services/api.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AddAssetsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<String> cryptoCurrency = <String>[].obs;
  RxString selectedCrypto = "".obs;
  RxDouble assetValue = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAssets();
  }

  Future<void> fetchAssets() async {
    isLoading.value = true;
    ApiService apiService = Get.find();
    var responseData = await apiService.getReq('currencies');
    CurrenciesListAPIResponse currenciesListAPIResponse =
        CurrenciesListAPIResponse.fromJson(responseData);
    currenciesListAPIResponse.cryptodata?.forEach(
      (currency) {
        cryptoCurrency.add(currency.name!);
      },
    );
    selectedCrypto.value = cryptoCurrency.first;
    log("==> $cryptoCurrency");
    isLoading.value = false;
  }
}
