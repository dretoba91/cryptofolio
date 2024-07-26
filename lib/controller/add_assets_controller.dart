import 'dart:developer';

import 'package:cryptofolio/models/api_data_response.dart';
import 'package:cryptofolio/models/crypto_currencies_data.dart';
import 'package:cryptofolio/services/api.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AddAssetsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<String> cryptoCurrency = <String>[].obs;
  RxString selectedCrypto = "".obs;
  RxDouble assetValue = 0.0.obs;
  RxList<CryptoCurrenciesData> coinData = <CryptoCurrenciesData>[].obs;
  RxList<Map<String, dynamic>> watchList = <Map<String, dynamic>>[].obs;

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
        watchList.add({
          'name': currency.name,
          'price': currency.values?.uSD?.price?.toDouble() ?? 0,
        });
      },
    );
    coinData.value = currenciesListAPIResponse.cryptodata ?? [];
    selectedCrypto.value = cryptoCurrency.first;
    // log("watch ==> $watchList");
    log("==============================================================");
    isLoading.value = false;
    // log("==> coin ${coinData}");
    _generateAndSortPrices();
    isLoading.value = false;
    isLoading.value = false;
  }

  void _generateAndSortPrices() {
    // Sort the prices in descending order
    // prices.sort((a, b) => b.compareTo(a));
    watchList.sort(
      (a, b) => b['price'].compareTo(a['price']),
    );
    watchList.value = watchList.take(12).toList();

    log("prices ==> $watchList");

    // Notify the framework that the state has changed
    // setState(() {});
  }
}
