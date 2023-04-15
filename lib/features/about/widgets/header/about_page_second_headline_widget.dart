import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:flutter_resume_website/features/about/widgets/widgets.dart';
import 'package:flutter_resume_website/main.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class AboutPageHeaderSecondHeadline extends HookWidget {
  const AboutPageHeaderSecondHeadline({Key? key, this.width = 450.0})
      : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    const spacing = 50.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildTitle(context),
        const SizedBox(height: spacing),
        buildSubtitle(context),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return AboutPageText(
      text: AppStrings.aboutPageBodyTitle,
      textAlign: isWebMobile ? TextAlign.justify : TextAlign.left,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget buildSubtitle(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
          wordSpacing: 3,
          height: 1.5,
        );
    // Workaround against ASSERT: num != num
    // https://github.com/flutter/flutter/issues/107777
    const blankSpace = WidgetSpan(child: Text(' '));

    return SizedBox(
      width: width,
      child: RichText(
        textAlign: isWebMobile ? TextAlign.justify : TextAlign.left,
        text: TextSpan(
          style: textStyle,
          children: [
            const TextSpan(text: AppStrings.aboutPageBodySubtitle1),
            TextSpan(
                text: AppStrings.aboutPageBodySubtitleCaterpillar,
                style: textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                  await url.launchUrl(Uri.parse(AppStrings.caterpillarLink));
                  }),
            const TextSpan(text: AppStrings.aboutPageBodySubtitle2),
            TextSpan(
                text: AppStrings.aboutPageBodySubtitleHuckAdventures,
                style: textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await url
                        .launchUrl(Uri.parse(AppStrings.huckAdventuresLink));
                  }),
            blankSpace,
            const TextSpan(text: AppStrings.aboutPageBodySubtitle3),
            blankSpace,
            TextSpan(
                text: AppStrings.aboutPageBodySubtitleBunq,
                style: textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await url.launchUrl(Uri.parse(AppStrings.bunqLink));
                  }),
            const TextSpan(text: AppStrings.aboutPageBodySubtitle4),
          ],
        ),
      ),
    );
  }
}
