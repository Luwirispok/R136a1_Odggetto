import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    this.title,
    this.text1,
    this.text2,
    this.photoUrl,
    this.isBorder = false,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final String? text1;
  final String? text2;
  final String? photoUrl;
  final bool isBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: isBorder
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                )
              : null,
          height: 100,
          width: double.infinity,
          color: AppColors.tertiary,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.emptyWidth,
              Icon(
                Icons.add_a_photo_outlined,
                color: AppColors.onTertiary1.withOpacity(0.5),
                size: 80,
              ),
              17.emptyWidth,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    7.emptyHeight,
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        color: AppColors.onTertiary1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 22 / 20,
                      ),
                    ),
                    Text(
                      text1 ?? '',
                      style: const TextStyle(
                        color: AppColors.onTertiary1,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        height: 15 / 13,
                      ),
                    ),
                    22.spacer,
                    Text(
                      text2 ?? '',
                      style: const TextStyle(
                        color: AppColors.onTertiary1,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 21 / 16,
                      ),
                    ),
                    10.emptyHeight,
                  ],
                ),
              ),
              16.emptyWidth,
            ],
          ),
        ),
        onTap != null
            ? Positioned(
                bottom: 1,
                right: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 36,
                    bottom: 10,
                  ),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.onTertiary2,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(Icons.edit),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
