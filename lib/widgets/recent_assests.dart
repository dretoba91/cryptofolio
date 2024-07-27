import 'dart:developer';

import 'package:cryptofolio/controller/assets_controlller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/helpers/utils.dart';
import 'package:cryptofolio/models/added_asset.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RecentAssests extends StatelessWidget {
  RecentAssests({super.key});
  AssetsController assetsController = Get.find();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SizedBox(
      height: 105,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: assetsController.addedAssets.length,
        itemBuilder: (context, index) {
          AddedAsset asset = assetsController.addedAssets[index];
          log("==> empty: ${assetsController.addedAssets.length}");

          return NeophCard(
            width: ScreenUtils.screenWidth * 0.70,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: ListTile(
                leading: Image.network(
                  'https://i.pinimg.com/564x/0c/a8/ea/0ca8ea00471945759158e63736f13fb2.jpg',
                  height: 40,
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
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'USD: ${assetsController.getAssetPrice(asset.name!).toStringAsFixed(3)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  '${asset.amount}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}




// Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Image.network(
//                         //   getCryptoImageURL(asset.name!),
//                         //   height: 1,
//                         //   width: 1,
//                         // ),
//                         const SizedBox(
//                           child: Text(
//                             'image',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         Text(
//                           '${asset.name}',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     'USD: ${assetsController.getAssetPrice(asset.name!).toStringAsFixed(3)}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
            