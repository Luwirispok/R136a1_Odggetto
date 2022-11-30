import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';


class CustomCardWidget extends StatelessWidget {
  final String option;

  final Color color;

  CustomCardWidget({
    super.key,
    required this.option,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: color,
        child: ListTile(
          title: Text(
            textDirection: TextDirection.ltr,
            option,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
