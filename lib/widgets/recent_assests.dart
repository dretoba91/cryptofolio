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
      height: 120,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          final assetReversed = assetsController.addedAssets.reversed.toList();
          AddedAsset asset = assetReversed[index];
          log("==> empty: ${assetsController.addedAssets.length}");

          return NeophCard(
            width: ScreenUtils.screenWidth * 0.60,
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
