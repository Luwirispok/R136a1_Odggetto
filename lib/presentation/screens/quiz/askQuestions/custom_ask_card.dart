import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';


class CustomAskCardWidget extends StatelessWidget {
  final String option;
  final bool isInput;
  final Color color;
  final Function(String)? onChange;

  CustomAskCardWidget({
    super.key,
    required this.option,
    required this.color,
    this.isInput = false,
    this.onChange,
  });

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: color,
        child: ListTile(
          title: !isInput
              ? Text(
                  textDirection: TextDirection.ltr,
                  option,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                )
              : TextField(
                  textAlign: TextAlign.center,
                  controller: textEditingController,
                  onChanged: isInput ? onChange : null,
                  decoration: InputDecoration(
                    hintText: option,
                    hintStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
        ),
      ),
    );
  }
}
