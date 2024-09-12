import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/typographies.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    super.key,
  }) : isSecondary = false;

  const SubmitButton.secondary({
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    super.key,
  }) : isSecondary = true;

  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;
  final bool isSecondary;

  Widget _buildSecondaryButton(BuildContext context) {
    return Material(
      color: Colours.transparent,
      borderRadius: BorderRadius.circular(8),
      borderOnForeground: false,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: isLoading ? null : onPressed,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colours.appTone200),
            borderRadius: BorderRadius.circular(8),
            color: Colours.appTone100,
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator.adaptive(
                      strokeAlign: BorderSide.strokeAlignInside,
                      strokeWidth: 3,
                      strokeCap: StrokeCap.round,
                      backgroundColor: Colours.transparent,
                    ),
                  )
                : Text(
                    text,
                    style: Typographies.semiBold12.copyWith(
                      color: Colours.appTone300,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return Material(
      color: Colours.transparent,
      child: Stack(
        children: [
          // Background circles
          Positioned(
            top: -24,
            left: 20,
            child: Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colours.appTone200
                    .withOpacity(0.5), // Adjust circle color and opacity
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            right: 145,
            child: Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colours.appTone100
                    .withOpacity(0.3), // Adjust circle color and opacity
              ),
            ),
          ),
          // The InkWell with the splash
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: isLoading ? null : onPressed,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colorScheme.primary, // Button background color
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: isLoading
                      ? SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator.adaptive(
                            strokeAlign: BorderSide.strokeAlignInside,
                            strokeWidth: 3,
                            strokeCap: StrokeCap.round,
                            backgroundColor: context.colorScheme.onPrimary,
                          ),
                        )
                      : Text(
                          text,
                          style: Typographies.semiBold12.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isSecondary) {
      return _buildSecondaryButton(context);
    }
    return _buildPrimaryButton(context);
  }
}
