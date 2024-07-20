import 'package:cryptofolio/widgets/card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19262A),
      appBar: AppBar(
        title: const Text('Crypto Home page'),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            NeophCard(),
          ],
        ),
      ),
    );
  }
}
