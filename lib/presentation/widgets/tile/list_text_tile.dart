import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class ListTextTile extends StatelessWidget {
  const ListTextTile({Key? key, required this.title, this.textList}) : super(key: key);

  final String title;
  final List<String>? textList;

  List<Widget> stringWithWidget(List<String> list) {
    return [
      for (int i = 0; i < list.length; i++)
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 7),
          child: Text(
            list[i],
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal,
              height: 18 / 15,
            ),
          ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            height: 18 / 15,
          ),
        ),
        ...stringWithWidget(textList!),
      ],
    );
  }
}
