import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.onTap,
    required this.text,
    this.width = double.infinity,
    this.height = 50,
    this.onLongPress,
    this.textStyle,
    this.decoration,
    this.color = Colors.white,
    this.borderRadius,
    this.enable = true,
  }) : super(key: key);

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String text;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final Color? color;
  final BoxDecoration? decoration;
  final BorderRadius? borderRadius;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        if (enable) onTap?.call();
      },
      onLongPress: () {
        if (enable) onLongPress?.call();
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: decoration ??
            BoxDecoration(
              // color: color,
              gradient: AppColors.secondary,
              borderRadius: borderRadius ?? BorderRadius.circular(9),
            ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                color: AppColors.onSecondary1,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 24 / 20,
              ),
        ),
      ),
    );
  }
}
