import 'dart:developer';

import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetsBottomsheet extends StatelessWidget {
  AddAssetsBottomsheet({super.key});
  final addAssetsController = Get.put(AddAssetsController());
  final ScrollController _scrollController = ScrollController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Obx(
      () => SafeArea(
        child: Container(
          height: ScreenUtils.screenHeight - 500,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFF19262A),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: addAssetsController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton(
                          value: addAssetsController.selectedCrypto.value,
                          dropdownColor: const Color(0xFF5483B3),
                          // itemHeight: 50,
                          menuMaxHeight: 400,
                          underline: null,
                          borderRadius: BorderRadius.circular(8.0),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          items: addAssetsController.cryptoCurrency
                              .map((crypto) => DropdownMenuItem(
                                    value: crypto,
                                    child: Text(crypto),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              addAssetsController.selectedCrypto.value = value;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        TextField(
                          controller: textController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Enter some text',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            // Handle text changes
                            addAssetsController.assetValue.value =
                                double.parse(value);

                            log("inside text field ${textController.text}");
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                          onSubmitted: (value) {
                            // Handle form submission
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
