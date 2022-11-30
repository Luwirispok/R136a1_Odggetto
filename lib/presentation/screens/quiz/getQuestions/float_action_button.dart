import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

// class NextButton extends StatelessWidget {
//   const NextButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){},
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: ,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Text(
//           '',
//         ),
//       ),
//     );
//   }
// }

class NextButton extends StatelessWidget {
  const NextButton({
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
    return InkWell(
      onTap: onLongPress,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: decoration ??
            BoxDecoration(
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
