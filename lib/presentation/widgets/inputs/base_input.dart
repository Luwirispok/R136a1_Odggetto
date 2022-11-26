import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class BaseInput extends StatefulWidget {
  const BaseInput(
      {Key? key,
      this.prefix,
      this.suffix,
      this.prefixPadding = const EdgeInsets.only(right: 8, left: 10),
      this.suffixPadding = const EdgeInsets.only(left: 8, right: 10),
      this.onChanged,
      this.onTap,
      this.text,
      this.label,
      this.hint,
      this.helper,
      this.error,
      this.textStyle,
      this.labelStyle,
      this.hintStyle,
      this.enable = true,
      this.backgroundColor,
      this.contentPadding,
      this.inputFormatters,
      this.maxLength = 120,
      this.minLines = 1,
      this.maxLines = 1,
      this.keyboardType,
      this.obscureText = false,
      this.obscuringCharacter,
      this.border,
      this.borderError,
      this.textInputAction,
      this.focus,
        this.floatingLabelBehavior, this.errorStyle,})
      : super(key: key);

  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputAction? textInputAction; //переход при нажатии на выполнено на клавиатуре
  final FocusNode? focus; //отслеживает клавиатуру и фокус на поле ввода
  final InputBorder? border; //границы
  final InputBorder? borderError; //границы при ошибке
  final List<TextInputFormatter>? inputFormatters; //маски форматирования
  final int? maxLength; //макс. символов в строке
  final int? minLines; //мин. кол-во строк
  final int? maxLines; //макс. кол-во строк
  final TextInputType? keyboardType; //тип клавиатуры
  final Color? backgroundColor; //цвет фона
  final EdgeInsets? contentPadding; //внешние отступы
  final bool enable;
  final bool obscureText; //скрытие текста для пароля
  final String? obscuringCharacter; //символ, который скрывает строку
  final String? text; //заданный текст
  final TextStyle? textStyle;
  final String? label; //на поле, а потом вверх уходит
  final TextStyle? labelStyle;
  final String? hint; //на поле
  final TextStyle? hintStyle;
  final String? helper; //помощь под полем
  final String? error; //в случае ошибки
  final TextStyle? errorStyle;
  //виджет перед полем ввода
  final Widget? prefix;
  final EdgeInsets prefixPadding;

  //виджет после полем ввода
  final Widget? suffix;
  final EdgeInsets suffixPadding;
  final ValueChanged<String>? onChanged; //срабатывает при каждом изменении поля
  final VoidCallback? onTap; //срабатывает при тапе на поле

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.text);
    super.initState();
  }

  final InputBorder _border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
  );

  final InputBorder _borderError = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: TextField(

        textInputAction: widget.textInputAction,
        focusNode: widget.focus,
        style: widget.textStyle,
        //https://pub.dev/packages/mask_text_input_formatter
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        controller: _textEditingController,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        minLines: widget.minLines,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          filled: true,
          fillColor: widget.backgroundColor,
          hoverColor: widget.backgroundColor,
          border: widget.border ?? _border,
          focusedBorder: widget.border ?? _border,
          enabledBorder: widget.border ?? _border,
          errorBorder: widget.borderError ?? _borderError,
          errorStyle: widget.errorStyle ?? const TextStyle(color: Colors.red),
          disabledBorder: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.label,
          labelStyle: widget.labelStyle ?? const TextStyle(color: Colors.grey),
          errorText: widget.error,
          hintText: widget.hint,
          helperStyle: widget.hintStyle,
          helperText: widget.helper,
          counterText: '',
          prefixIcon: widget.prefix != null ? Padding(
            padding: widget.prefixPadding,
            child: widget.prefix,
          ) : null,
          suffixIcon: widget.suffix != null ? Padding(
            padding: widget.suffixPadding,
            child: widget.suffix,
          ) : null,
        ),
        onChanged: (text) {
          widget.onChanged?.call(text);
        },
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
