import 'dart:developer';

import 'package:cryptofolio/controller/add_assets_controller.dart';
import 'package:cryptofolio/controller/assets_controlller.dart';
import 'package:cryptofolio/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetsBottomsheet extends StatefulWidget {
  AddAssetsBottomsheet({super.key});

  @override
  State<AddAssetsBottomsheet> createState() => _AddAssetsBottomsheetState();
}

class _AddAssetsBottomsheetState extends State<AddAssetsBottomsheet>
    with WidgetsBindingObserver {
  final addAssetsController = Get.put(AddAssetsController());

  final ScrollController _scrollController = ScrollController();

  TextEditingController textController = TextEditingController();
  final _focusNode = FocusNode();
  double _bottomInset = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _scrollToFocusedInput();
    }
  }

  void _scrollToFocusedInput() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset != _bottomInset) {
      setState(() {
        _bottomInset = bottomInset;
      });
      if (_focusNode.hasFocus) {
        _scrollToFocusedInput();
      }
    }
  }

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: textController,
                                focusNode: _focusNode,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Enter some value',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  // Handle text changes
                                  if (value == '') {
                                    return;
                                  }
                                  addAssetsController.assetValue.value =
                                      double.parse(value);

                                  log("inside text field ${textController.text}");
                                },
                                onSubmitted: (value) {
                                  // Handle form submission
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            GestureDetector(
                              onTap: () {
                                AssetsController newAsset = Get.find();
                                newAsset.addNewAsset(
                                    addAssetsController.selectedCrypto.value,
                                    addAssetsController.assetValue.value);
                                Get.back();
                              },
                              child: const Icon(
                                Icons.send_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 250,
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
