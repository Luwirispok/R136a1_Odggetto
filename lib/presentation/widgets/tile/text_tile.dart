import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class TextTile extends StatelessWidget {
  const TextTile({Key? key, this.title, this.text, this.textList}) : super(key: key);

  final String? title;
  final String? text;
  final List<String>? textList;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title != null ? "$title: " : null,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            height: 18 / 15,
          ),
          children: <TextSpan>[TextSpan(text: text, style: const TextStyle(fontWeight: FontWeight.normal))]),
    );
  }
}
