import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/widgets/inputs/base_input.dart';

class DefaultInput extends StatelessWidget {
  const DefaultInput({
    Key? key,
    this.error,
    this.label,
    this.text,
    this.onChanged,
    this.onTap,
    this.textInputAction,
    this.inputFormatters,
  }) : super(key: key);

  final String? error;
  final String? label;
  final String? text;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      error: error,
      label: label,
      text: text,
      onTap: onTap,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      borderError: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      textStyle: const TextStyle(color: AppColors.onPrimary, fontSize: 16, height: 24 / 16),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.onTertiary2),
      ),
    );
  }
}
