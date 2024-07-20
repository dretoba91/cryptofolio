import 'dart:developer';

import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      body: SafeArea(
        child: Container(
          width: ScreenUtils.screenWidth,
          height: ScreenUtils.screenHeight,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'latest rates',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 80,
                              ),
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 80,
                              ),
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 80,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 80,
                              ),
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 80,
                              ),
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 80,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'recent assets',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 100,
                              ),
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 100,
                              ),
                              NeophCard(
                                width: ScreenUtils.screenWidth * 0.30,
                                height: 100,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.yellow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeophCard(
                        width: ScreenUtils.screenWidth * 0.40,
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.pink,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeophCard(
                        width: ScreenUtils.screenWidth * 0.40,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
