import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.title, this.backgroundColor, this.isBack = false}) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: backgroundColor,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBack
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: AppColors.onBackground,
                  ),
                )
              : 0.emptyWidth,
          Expanded(
            child: Text(
              title ?? '',
              style: const TextStyle(
                color: AppColors.onBackground,
                fontSize: 20,
                height: 28 / 22,
              ),
            ),
          ),
          isBack ? 24.emptyWidth : 0.emptyWidth,
        ],
      ),
    );
  }
}
