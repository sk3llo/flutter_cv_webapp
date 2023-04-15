import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/core/utils/app_images.dart';
import 'package:flutter_resume_website/features/home/widgets/header/widgets/dev_image.dart';
import 'package:flutter_resume_website/features/home/widgets/header/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:flutter_resume_website/main.dart';

class DevInfo extends HookWidget {
  final double opacityValues;

  const DevInfo({Key? key, required this.opacityValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devNameOpacity = opacityValues >= 1 ? 1.0 : 0.0;
    final bodyOpacity = opacityValues >= 2 ? 1.0 : 0.0;
    final baseOpacity = opacityValues >= 3 ? 1.0 : 0.0;
    final sauceOpacity = opacityValues >= 4 ? 1.0 : 0.0;
    final firstToppingOpacity = opacityValues >= 5.0 ? 1.0 : 0.0;
    final secondToppingOpacity = opacityValues > 5 ? 1.0 : 0.0;

    return Column(
      children: [
        // Headline
        HiImDevName(devNameOpacity: devNameOpacity),
        const Padding(padding: AppDimensions.paddingBottom24),
        // Image here if using mobile device
        isWebMobile ? Padding(
          padding: AppDimensions.paddingBottom32,
          child: DevImage(
            imageAsset: AppImages.devFirstImage,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ) : Container(),
        // Body text
        AppAnimText.bodyStyle(
          text: AppStrings.bodyText,
          textAlign: isWebMobile ? TextAlign.justify : TextAlign.left,
          opacity: bodyOpacity,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 22),
        ),
        const Padding(padding: AppDimensions.paddingBottom40),
        // Pizza properties
        AppAnimText(
          text: AppStrings.pizzaBase,
          emoji: AppImages.pizzaEmoji,
          opacity: baseOpacity,
          shouldAddDash: true,
        ),
        const Padding(padding: AppDimensions.paddingBottom32),
        AppAnimText(
          text: AppStrings.pizzaSauce,
          emoji: AppImages.sauceEmoji,
          opacity: sauceOpacity,
          shouldAddDash: true,
        ),
        const Padding(padding: AppDimensions.paddingBottom32),
        PizzaToppings(
          firstToppingOpacity,
          secondToppingOpacity,
          emoji: AppImages.saltEmoji,
        ),
      ],
    );
  }
}
