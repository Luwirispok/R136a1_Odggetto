import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/widgets/inputs/default_input.dart';
import 'package:oggetto_r136a1/presentation/widgets/safe_area_with_background.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWithBackground(),
    );
  }
}

