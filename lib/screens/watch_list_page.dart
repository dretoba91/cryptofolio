import 'dart:developer';

import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/models/crypto_currencies_data.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WatchListPage extends StatelessWidget {
  final CryptoCurrenciesData cryptoCoin;
  const WatchListPage({super.key, required this.cryptoCoin});

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
                width: ScreenUtils.screenWidth * 0.70,
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
                      textAlign: TextAlign.center,
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
                            text: ' USD \n\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),

                          TextSpan(
                            text:
                                '${cryptoCoin.values?.uSD?.percentChange24h} %',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  cryptoCoin.values!.uSD!.percentChange24h! > 0
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NeophCard(
                    height: 120,
                    width: ScreenUtils.screenWidth * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.trending_up_outlined,
                            //   size: 40,
                            //   color: Colors.white,
                            // ),
                            Text(
                              'marketCap USD',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            TextSpan(
                              children: [
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
                        )
                      ],
                    ),
                  ),
                  NeophCard(
                    height: 120,
                    width: ScreenUtils.screenWidth * 0.40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.trending_down_outlined,
                            //   size: 40,
                            //   color: Colors.white,
                            // ),
                            Text(
                              'volume24h USD',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${cryptoCoin.values?.uSD?.marketCap?.toStringAsFixed(2)} ',
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
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NeophCard(
                    height: 180,
                    width: ScreenUtils.screenWidth * 0.30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                'circulatingSupply',
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFC1E8FF),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${cryptoCoin.circulatingSupply?.toStringAsFixed(2) ?? 0}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  NeophCard(
                    height: 180,
                    width: ScreenUtils.screenWidth * 0.30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'totalSupply',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${cryptoCoin.totalSupply?.toStringAsFixed(2) ?? 0}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  NeophCard(
                    height: 180,
                    width: ScreenUtils.screenWidth * 0.30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'maxSupply',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFC1E8FF),
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${cryptoCoin.maxSupply?.toStringAsFixed(2) ?? 0}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NeophCard(
                    height: 100,
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
                    height: 100,
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
