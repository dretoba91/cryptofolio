import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/models/crypto_currencies_data.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';

class WatchListPage extends StatefulWidget {
  final CryptoCurrenciesData cryptoCoin;
  const WatchListPage({super.key, required this.cryptoCoin});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> _animation;

  // late final AnimationController fadeController = AnimationController(
  //   vsync: this,
  //   duration: const Duration(seconds: 2),
  // );
  // late final Animation<double> _fadeAnimation = CurvedAnimation(
  //   parent: fadeController,
  //   curve: Curves.easeIn,
  // );

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();

    _animation = Tween<double>(begin: -1.0, end: 0.0).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    // fadeController.dispose();
  }

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
          widget.cryptoCoin.name!,
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
              AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: animation.value,
                      child: NeophCard(
                        height: 200,
                        width: ScreenUtils.screenWidth * 0.70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.cryptoCoin.symbol}',
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
                                        '${widget.cryptoCoin.values?.uSD?.price?.toStringAsFixed(5)} ',
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
                                        '${widget.cryptoCoin.values?.uSD?.percentChange24h} %',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: widget.cryptoCoin.values!.uSD!
                                                  .percentChange24h! >
                                              0
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
                    );
                  }),
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
                                      '${widget.cryptoCoin.values?.uSD?.marketCap?.toStringAsFixed(2)}',
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
                                      '${widget.cryptoCoin.values?.uSD?.marketCap?.toStringAsFixed(2)} ',
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
                                      '${widget.cryptoCoin.circulatingSupply?.toStringAsFixed(2) ?? 0}',
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
                                    '${widget.cryptoCoin.totalSupply?.toStringAsFixed(2) ?? 0}',
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
                                    '${widget.cryptoCoin.maxSupply?.toStringAsFixed(2) ?? 0}',
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
              AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(
                              ScreenUtils.screenWidth * _animation.value, 0),
                          child: NeophCard(
                            height: 100,
                            width: ScreenUtils.screenWidth * 0.40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            '${widget.cryptoCoin.values?.uSD?.high24h?.toStringAsFixed(2)} ',
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
                        ),
                        Transform.translate(
                          offset: Offset(
                              -ScreenUtils.screenWidth * _animation.value, 0),
                          child: NeophCard(
                            height: 100,
                            width: ScreenUtils.screenWidth * 0.40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            '${widget.cryptoCoin.values?.uSD?.low24h?.toStringAsFixed(2)} ',
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
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
