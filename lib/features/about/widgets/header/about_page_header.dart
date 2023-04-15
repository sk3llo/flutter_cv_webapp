import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/core/utils/app_images.dart';
import 'package:flutter_resume_website/features/about/widgets/header/about_page_first_headline.dart';
import 'package:flutter_resume_website/features/about/widgets/header/about_page_second_headline_widget.dart';
import 'package:flutter_resume_website/features/home/widgets/header/widgets/dev_image.dart';
import 'package:flutter_resume_website/main.dart';

class AboutPageHeader extends HookWidget {
  final GlobalKey headerKey;
  final double imageTopPaddingValue;

  const AboutPageHeader(this.headerKey, this.imageTopPaddingValue, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mQuerySize = MediaQuery.of(context).size;

    return isWebMobile
        ? mobileHeader(context, mQuerySize)
        : desktopHeader(context, mQuerySize, imageTopPaddingValue);
  }

  Widget desktopHeader(
    BuildContext context,
    Size mQuerySize,
    double imageTopPadding,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            key: headerKey,
            children: [
              SizedBox(height: mQuerySize.height / 4),
              const AboutPageHeaderFirstHeadline(),
              SizedBox(height: mQuerySize.height / 2),
              const AboutPageHeaderSecondHeadline()
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: imageTopPadding),
            child: DevImage(
              alignment: Alignment.centerRight,
              imageAsset: AppImages.devSecondImage,
              height: mQuerySize.height * .75,
              width: mQuerySize.width / 3,
              slideFrom: DevImageSlideFrom.right,
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileHeader(
    BuildContext context,
    Size mQuerySize,
  ) {
    return Column(
      key: headerKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const AboutPageHeaderFirstHeadline(),
        DevImage(
          alignment: Alignment.centerRight,
          imageAsset: AppImages.devSecondImage,
          height: mQuerySize.height * .75,
          width: mQuerySize.width,
          slideFrom: DevImageSlideFrom.right,
        ),
        const SizedBox(height: 32),
        const AboutPageHeaderSecondHeadline(),
      ],
    );
  }
}
