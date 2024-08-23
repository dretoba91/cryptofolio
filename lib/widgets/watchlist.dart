import 'dart:developer';
import 'dart:collection';

import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/controller/assets_controlller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/screens/watch_list_page.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  final addAssetsController = Get.put(AddAssetsController());
  AssetsController assetsController = Get.find();

  final controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(handleScrollController);
    log("watchlist: ${addAssetsController.watchList}");
  }

  void handleScrollController() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.removeListener(handleScrollController);
  }

  double calculateOpacity(double offset, int index, double width) {
    final itemSize = width * 0.1;
    final double viewportStart = offset;
    final double viewportEnd = viewportStart + width;
    final double itemStart = index * itemSize;
    final double itemEnd = itemStart + itemSize;

    double opacity = 0.0;
    if (itemStart >= viewportStart && itemEnd <= viewportEnd) {
      // Item is fully visible
      opacity = 1.0;
      log("fully visible: $opacity");
    } else if (itemStart > viewportStart && itemStart <= viewportEnd) {
      // Item is partially visible from the start
      opacity = (viewportEnd - itemStart) / itemSize;
      log("partially visible from the start: $opacity");
    } else if (itemEnd > viewportStart && itemEnd <= viewportEnd) {
      // Item is partially visible from the end
      opacity = (itemEnd - viewportStart) / itemSize;
      log("partially visible from the end: $opacity");
    }
    return opacity;
  }

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
          controller: controller,
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.9,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: addAssetsController.watchList
              .asMap()
              .map((index, item) {
                // log("index: $index");
                // log("index: $item");
                final double opacity = calculateOpacity(
                    controller.offset, index, ScreenUtils.screenWidth);
                return MapEntry(
                  index,
                  AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return AnimatedOpacity(
                          opacity: opacity,
                          duration: const Duration(milliseconds: 300),
                          // curve: Curves.easeIn,
                          child: Transform(
                            transform: Matrix4.identity()..scale(opacity, 1.0),
                            child: NeophCard(
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
                                      cryptoCoin: assetsController
                                          .getCoinData('${item['name']}')!,
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                );
              })
              .values
              .toList(),
        ),
      ),
    );
  }
}
