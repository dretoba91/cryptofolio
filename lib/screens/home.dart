import 'dart:developer';

import 'package:cryptofolio/controller/assets_controlller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/widgets/add_assets_bottomsheet.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:cryptofolio/widgets/recent_assests.dart';
import 'package:cryptofolio/widgets/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  AssetsController assetsController = Get.find();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    log('${MediaQuery.of(context).size.width}');
    return Scaffold(
      backgroundColor: const Color(0xFF19262A),
      appBar: AppBar(
        title: const Text(
          'Crypto Home page',
        ),
        backgroundColor: const Color(0xFF5483B3),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: ScreenUtils.screenWidth,
          height: ScreenUtils.screenHeight,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Watchlist',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     NeophCard(
                            //       width: ScreenUtils.screenWidth * 0.30,
                            //       height: 80,
                            //     ),
                            //     NeophCard(
                            //       width: ScreenUtils.screenWidth * 0.30,
                            //       height: 80,
                            //     ),
                            //     NeophCard(
                            //       width: ScreenUtils.screenWidth * 0.30,
                            //       height: 80,
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     NeophCard(
                            //       width: ScreenUtils.screenWidth * 0.30,
                            //       height: 80,
                            //     ),
                            //     NeophCard(
                            //       width: ScreenUtils.screenWidth * 0.30,
                            //       height: 80,
                            //     ),
                            //     NeophCard(
                            //       width: ScreenUtils.screenWidth * 0.30,
                            //       height: 80,
                            //     ),
                            //   ],
                            // )
                            Watchlist()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Recent assets',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.grey,
                              ),
                            ),
                            
                            assetsController.addedAssets.isEmpty
                                ? Center(
                                    child: NeophCard(
                                      width: ScreenUtils.screenWidth * 0.60,
                                      height: 100,
                                      child: const Center(
                                        child: Text(
                                          'you have zero assets!!. \n try to add an asset.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : RecentAssests(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NeophCard(
                            width: ScreenUtils.screenWidth * 0.50,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                            text: 'Total assets',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            )),
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
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'see all assets',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Add your button press logic here
                            showCupertinoModalBottomSheet(
                              context: context,
                              topRadius: const Radius.circular(24),
                              isDismissible: true,
                              enableDrag: true,
                              builder: (context) => Material(
                                child: AddAssetsBottomsheet(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFC1E8FF), // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Set the corner radius
                            ),
                          ),
                          child: const Text(
                            "Add Asset",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
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
