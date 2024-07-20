// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NeophCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  const NeophCard({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF19262A),
      child: Container(
        width: width ?? 150,
        height: height ?? 150,        
        decoration: BoxDecoration(
          color: const Color(0xFF19262A),
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            // begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff333333),
              Color(0xff333333),
            ],
          ),
          boxShadow: const [
            // BoxShadow(
            //   color: Color(0xff515151),
            //   offset: Offset(-20.0, -20.0),
            //   blurRadius: 30,
            //   spreadRadius: 0.0,
            // ),
            BoxShadow(
              color: Color(0xff151515),
              offset: Offset(20.0, 20.0),
              blurRadius: 30,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
