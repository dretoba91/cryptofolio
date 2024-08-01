import 'dart:developer';

import 'package:cryptofolio/controller/assets_controlller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/models/added_asset.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAssets extends StatelessWidget {
  AllAssets({super.key});
  AssetsController assetsController = Get.find();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF19262A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF273C42),
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios_outlined,
        //     color: Colors.white,
        //   ),
        // ),
        title: const Text(
          'My assets',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Color(0xFFC1E8FF),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => Container(
            width: ScreenUtils.screenWidth,
            height: ScreenUtils.screenHeight,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Center(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Total assets',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                          const TextSpan(
                            text: '\n\n',
                          ),
                          const TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: assetsController
                                .getTotalAssets()
                                .toStringAsFixed(3),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Assets',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 6,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    itemCount: assetsController.addedAssets.length,
                    itemBuilder: (context, index) {
                      // Reversing the added assets array values
                      final assetReversed =
                          assetsController.addedAssets.reversed.toList();
                      AddedAsset asset = assetReversed[index];

                      // Getting crypto data by name of the coin
                      final data = assetsController.getCoinData(asset.name!);
                      double percentChange24hr =
                          data!.values!.uSD!.percentChange24h!;

                      // Setting color value for percentage change.
                      Color color =
                          percentChange24hr > 0 ? Colors.green : Colors.red;
                      double? usdValue = asset.usdValue;

                      // Spliting double value into two
                      int intUsdValue = usdValue!.toInt();
                      double fractionUsdValue = usdValue - intUsdValue;
                      String fractionalPartStr = fractionUsdValue
                          .toStringAsFixed(2)
                          .replaceFirst("0.", "");

                      return NeophCard(
                        width: ScreenUtils.screenWidth * 0.80,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: ListTile(
                            isThreeLine: true,
                            leading: Image.network(
                              'https://i.pinimg.com/564x/0c/a8/ea/0ca8ea00471945759158e63736f13fb2.jpg',
                              height: 50,
                              width: 30,
                            ),
                            title: Text(
                              '${asset.name}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    'USD: ${assetsController.getAssetPrice(asset.name!).toStringAsFixed(3)}',
                                    softWrap: true,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    '${data.values?.uSD?.percentChange24h?.toStringAsFixed(3)} %',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${asset.amount}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$$intUsdValue',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),

                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: const Offset(0.0, -7.0),
                                          child: Text(
                                            '.$fractionalPartStr',
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              fontFeatures: [
                                                FontFeature.superscripts()
                                              ],
                                              color: Color(0xFFC1E8FF),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // TextSpan(
                                      //   text: '.$fractionalPartStr',
                                      //   style: const TextStyle(
                                      //       fontSize: 12.0,
                                      //       fontWeight: FontWeight.w500,
                                      //       fontFeatures: [
                                      //         FontFeature.superscripts()
                                      //       ],
                                      //       color: Colors.white),
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
