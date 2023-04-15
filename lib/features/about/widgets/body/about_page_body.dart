import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_website/features/about/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:flutter_resume_website/main.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPageBody extends StatelessWidget {
  const AboutPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isWebMobile ? 0 : 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isWebMobile ? 75 : 150),
          AboutPageText(
            width: MediaQuery.of(context).size.width,
            text: AppStrings.aboutPageBodyHeader,
            textAlign: isWebMobile ? TextAlign.center : TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 40),
          ),
          const SizedBox(height: 50),
          isWebMobile
              ? Column(
                  children: List.generate(
                      3, (pos) => blueBackgroundBlock(context, pos + 1)),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      3,
                      (pos) => Expanded(
                          child: blueBackgroundBlock(context, pos + 1))),
                ),
          letsStartAConvo(context),
        ],
      ),
    );
  }

  Widget blueBackgroundBlock(BuildContext context, int pos) {
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(right: 4, bottom: isWebMobile ? 12 : 0),
      padding: const EdgeInsets.all(26),
      color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '0$pos',
              style: theme.labelLarge,
            ),
          ),
          SizedBox(height: isWebMobile ? 20 : 30),
          Text(
            pos == 1
                ? AppStrings.aboutPageFirstBodyBlockTitle
                : pos == 2
                    ? AppStrings.aboutPageSecondBodyBlockTitle
                    : AppStrings.aboutPageThirdBodyBlockTitle,
            textAlign: isWebMobile ? TextAlign.center : TextAlign.left,
            style: theme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            pos == 1
                ? AppStrings.aboutPageFirstBodyBlockSubtitle
                : pos == 2
                    ? AppStrings.aboutPageSecondBodyBlockSubtitle
                    : AppStrings.aboutPageThirdBodyBlockSubtitle,
            textAlign: isWebMobile ? TextAlign.justify : TextAlign.left,
            style: theme.titleSmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget letsStartAConvo(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 24,
          letterSpacing: 1,
          height: 1.5,
        );

    return Column(
      children: [
        SizedBox(height: isWebMobile ? 75 : 150),
        AboutPageText(
          width: MediaQuery.of(context).size.width,
          text: AppStrings.aboutPageBottomTitle,
          textAlign: isWebMobile ? TextAlign.center : TextAlign.left,
          style:
              Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 40),
        ),
        SizedBox(height: isWebMobile ? 50 : 100),
        Container(
            alignment: Alignment.centerRight,
            width: 600.0,
            child: RichText(
              textAlign: isWebMobile ? TextAlign.justify : TextAlign.left,
              text: TextSpan(
                style: textStyle,
                children: [
                  TextSpan(
                    text: AppStrings.aboutPageBottomSubtitle1,
                    style: textStyle,
                  ),
                  TextSpan(
                    text: AppStrings.devEmail,
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launchUrl(
                            Uri.parse('mailto:${AppStrings.devEmail}'));
                      },
                  ),
                  TextSpan(
                    text: AppStrings.aboutPageBottomSubtitle2,
                    style: textStyle,
                  ),
                ],
              ),
            )
            // child: AboutPageText(
            //   text: AppStrings.aboutPageBottomSubtitle,
            //   textAlign: TextAlign.left,
            //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //         fontSize: 24,
            //         letterSpacing: 1,
            //         height: 1.5,
            //       ),
            // ),
            ),
      ],
    );
  }
}
