import 'package:cryptofolio/helpers/constants.dart';
import 'package:flutter/material.dart';

class AddAssetsBottomsheet extends StatelessWidget {
  AddAssetsBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SafeArea(
      child: Container(
        height: ScreenUtils.screenHeight - 200,
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                hintText: 'Enter some text',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Handle text changes
              },
              onSubmitted: (value) {
                // Handle form submission
              },
            ),
          ],
        ),
      ),
    );
  }
}
