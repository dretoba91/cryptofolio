import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/controller/assets_controlller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/screens/watch_list_page.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Watchlist extends StatelessWidget {
  Watchlist({super.key});

  final addAssetsController = Get.put(AddAssetsController());
  AssetsController assetsController = Get.find();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.9,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: addAssetsController.watchList.map((item) {
            return NeophCard(
              width: ScreenUtils.screenWidth * 0.30,
              height: 90,
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
                      height: 5,
                    ),
                    Text(
                      '${item['price'].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${item['percentChange24h'].toStringAsFixed(2)} %',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: item['percentChange24h'] > 0
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(() {
                    return WatchListPage(
                      cryptoCoin:
                          assetsController.getCoinData('${item['name']}')!,
                    );
                  });
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
