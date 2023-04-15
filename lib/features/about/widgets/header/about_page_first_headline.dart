import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/features/about/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';

class AboutPageHeaderFirstHeadline extends HookWidget {
  const AboutPageHeaderFirstHeadline({
    Key? key,
    this.width = 450.0,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final isHeaderFocused = useState(false);
    const spacing = 16.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title(context),
        const SizedBox(height: spacing),
        subtitles(context, isHeaderFocused),
      ],
    );
  }

  Widget title(BuildContext context) {
    return AboutPageText(
      text: AppStrings.aboutPageHeaderTitle,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }

  Widget subtitles(
    BuildContext context,
    ValueNotifier<bool> isHeaderFocused,
  ) {
    return MouseRegion(
      onEnter: (_) => isHeaderFocused.value = true,
      onExit: (_) => isHeaderFocused.value = false,
      child: Stack(
        children: [
          AboutPageText(
            width: width,
            opacity: isHeaderFocused.value ? 0 : 1,
            text: AppStrings.aboutPageHeaderFirstSubtitle,
          ),
          AboutPageText(
            width: width,
            opacity: isHeaderFocused.value ? 1 : 0,
            text: AppStrings.aboutPageHeaderFirstSubtitleFlipped,
          ),
        ],
      ),
    );
  }
}
