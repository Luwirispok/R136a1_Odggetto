import 'dart:ui';

import 'package:flutter/material.dart';

class SafeAreaWithBackground extends StatelessWidget {
  const SafeAreaWithBackground({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          child ?? const SizedBox(),
          Center(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 150,
                sigmaY: 150,
              ),
              child: Container(
                width: 142,
                height: 142,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment(-1, -1),
                    end: Alignment(1, 1),
                    colors: [Color(0xa5ffffff), Color(0xa5ffed00), Color(0xa5fdc200)],
                    stops: [0.052, 0.646, 1],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
