import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/typographies.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          foregroundColor: context.colorScheme.onPrimary,
          textStyle: Typographies.semiBold14,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.colorScheme.primary, // Button background color
          ),
          child: Stack(
            children: [
              // Circle 1
              Positioned(
                top: -24,
                left: 20,
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colours.appTone200
                        .withOpacity(0.4), // Adjust circle color and opacity
                  ),
                ),
              ),
              // Circle 2
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
              // Button content
              Center(
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
                      : child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
