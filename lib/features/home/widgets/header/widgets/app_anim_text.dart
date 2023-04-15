import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';

class AppAnimText extends HookWidget {
  const AppAnimText({
    Key? key,
    required this.text,
    required this.opacity,
    this.emoji,
    this.style,
    this.letterSpacing,
    this.textAlign,
    this.alignment = Alignment.centerLeft,
    this.width = 460,
    this.shouldAddDash = false,
  }) : super(key: key);

  factory AppAnimText.bodyStyle({
    required String text,
    required double opacity,
    required TextStyle? style,
    bool? shouldAddDash,
    TextAlign? textAlign,
  }) {
    return AppAnimText(
      text: text,
      letterSpacing: 2,
      opacity: opacity,
      style: style,
      alignment: Alignment.center,
      shouldAddDash: shouldAddDash ?? false,
      textAlign: textAlign,
    );
  }

  final String text;
  final double opacity;
  final String? emoji;
  final TextStyle? style;
  final Alignment alignment;
  final TextAlign? textAlign;
  final double? width;
  final double? letterSpacing;
  final bool? shouldAddDash;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: alignment,
      child: AnimatedOpacity(
          opacity: opacity,
          duration: AppAnim.defaultAnimDuration,
          child: RichText(
            textAlign: textAlign ?? TextAlign.left,
            text: TextSpan(
              style: style ??
                  Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(letterSpacing: letterSpacing),
              children: [
                if (shouldAddDash != null && shouldAddDash!)
                  const TextSpan(text: '- '),
                if (emoji != null)
                  WidgetSpan(
                      child: Image.asset(
                    emoji!,
                    width: 24,
                    height: 24,
                  )),
                TextSpan(text: text),
              ],
            ),
          )),
    );
  }
}
