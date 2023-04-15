import 'package:flutter/material.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:flutter_resume_website/main.dart';

class HiImDevName extends StatelessWidget {
  const HiImDevName({
    Key? key,
    required this.devNameOpacity,
  }) : super(key: key);

  final double devNameOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: devNameOpacity,
      duration: AppAnim.defaultAnimDuration,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: isWebMobile
                ? '${AppStrings.headlineText}\n'
                : AppStrings.headlineText,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          TextSpan(
            text: AppStrings.devFirstName,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          TextSpan(
            text: '!',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ]),
      ),
    );
  }
}
