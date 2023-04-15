import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/features/home/widgets/jobs_list/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:flutter_resume_website/main.dart';

class Job extends HookWidget {
  const Job({
    Key? key,
    required this.companyName,
    required this.imageAsset,
    required this.description,
    required this.flippedDescription,
  }) : super(key: key);

  final String companyName;
  final String imageAsset;
  final String description;
  final String flippedDescription;

  @override
  Widget build(BuildContext context) {
    final isFocused = useState(false);

    return MouseRegion(
      onEnter: (_) => isFocused.value = true,
      onExit: (_) => isFocused.value = false,
      child: Container(
        // Highlight decoration
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isFocused.value
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              width: .5,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: isWebMobile ? 24 : 0),
        child: isWebMobile
            ? mobileJobDescription(context)
            : desktopJobDescription(context),
      ),
    );
  }

  Row desktopJobDescription(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: JobDescription(
          title: companyName,
          description: description,
          flippedDescription: flippedDescription,
        ),
      ),
      Expanded(child: image(context)),
    ]);
  }

  Widget mobileJobDescription(BuildContext context) {
    return Column(
      children: [
        image(context),
        const SizedBox(height: 12),
        JobDescription(
          title: companyName,
          description: description,
          flippedDescription: flippedDescription,
        ),
      ],
    );
  }

  Widget image(BuildContext context) {
    return Container(
      height: isWebMobile
          ? AppDimensions.mobileJobWidgetHeight
          : AppDimensions.desktopJobWidgetHeight,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
      child: Transform.scale(
        scale: isWebMobile ? 1 : .7,
        child: ImageWrapper(
          image: imageAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
