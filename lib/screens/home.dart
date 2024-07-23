import 'dart:developer';

import 'package:cryptofolio/helpers/constants.dart';
import 'package:cryptofolio/widgets/add_assets_bottomsheet.dart';
import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
      resizeToAvoidBottomInset: false,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
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
                          width: ScreenUtils.screenWidth * 0.40,
                          height: 120,
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
                          "Add Transaction",
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
    );
  }
}
