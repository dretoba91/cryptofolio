import 'dart:developer';

import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/models/crypto_currencies_data.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchListPage extends StatelessWidget {
  final CryptoCurrenciesData cryptoCoin;
  const WatchListPage({super.key, required this.cryptoCoin});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    log('==> ${cryptoCoin.values?.bTC?.price}');
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
        title: Text(
          cryptoCoin.name!,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Color(0xFFC1E8FF),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: ScreenUtils.screenWidth,
          height: ScreenUtils.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NeophCard(
                height: 200,
                width: ScreenUtils.screenWidth * 0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${cryptoCoin.symbol}',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${cryptoCoin.values?.uSD?.price?.toStringAsFixed(5)} ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const TextSpan(
                            text: ' USD',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text.rich(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'marketCap USD \n\n',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFC1E8FF),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${cryptoCoin.values?.uSD?.marketCap?.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Text.rich(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'volume24h USD \n\n',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFC1E8FF),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${cryptoCoin.values?.uSD?.marketCap?.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NeophCard(
                    height: 200,
                    width: ScreenUtils.screenWidth * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.trending_up_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'high24h',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${cryptoCoin.values?.uSD?.high24h?.toStringAsFixed(2)} ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const TextSpan(
                                text: ' USD',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  NeophCard(
                    height: 200,
                    width: ScreenUtils.screenWidth * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.trending_down_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'low24h',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${cryptoCoin.values?.uSD?.low24h?.toStringAsFixed(2)} ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const TextSpan(
                                text: ' USD',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
