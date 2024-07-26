import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Watchlist extends StatelessWidget {
  Watchlist({super.key});

  final addAssetsController = Get.put(AddAssetsController());

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 1.0,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: addAssetsController.watchList.map((item) {
          return NeophCard(
            width: ScreenUtils.screenWidth * 0.30,
            height: 80,
            child: ListTile(
              title: Text(
                '${item['name']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC1E8FF),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                children: [
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    '${item['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
