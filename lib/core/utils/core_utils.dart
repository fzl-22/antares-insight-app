import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/typographies.dart';
import 'package:antares_insight_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CoreUtils<T> {
  const CoreUtils._();

  static void showSnackBar({
    required BuildContext context,
    required String message,
    required SnackBarType type,
  }) {
    late Color backgroundColor;
    late Icon prefixIcon;

    if (type == SnackBarType.warning) {
      backgroundColor = Colours.warning50;
      prefixIcon = const Icon(
        IconsaxPlusBold.info_circle,
        color: Colours.warning300,
        size: 20,
      );
    } else if (type == SnackBarType.error) {
      backgroundColor = Colours.danger50;
      prefixIcon = const Icon(
        IconsaxPlusBold.close_circle,
        color: Colours.danger300,
        size: 20,
      );
    } else {
      backgroundColor = Colours.success50;
      prefixIcon = const Icon(
        IconsaxPlusBold.tick_circle,
        color: Colours.success300,
        size: 20,
      );
    }

    context
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(12),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: context.height - 100,
            left: 16,
            right: 16,
          ),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          dismissDirection: DismissDirection.horizontal,
          content: Row(
            children: [
              prefixIcon,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: Typographies.normal12.copyWith(
                    color: Colours.neutral900,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => context.clearSnackBars(),
                child: const Icon(
                  IconsaxPlusLinear.close_circle,
                  size: 12,
                  color: Colours.neutral700,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
