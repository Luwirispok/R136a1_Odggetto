import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: AppColors.onBackground,
            ),
          ),
          Text(
            title ?? '',
            style: const TextStyle(
              color: AppColors.onBackground,
              fontSize: 22,
              height: 28 / 22,
            ),
          ),
          24.emptyWidth,
        ],
      ),
    );
  }
}
