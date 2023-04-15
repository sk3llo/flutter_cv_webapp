import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/features/about/widgets/header/about_page_header.dart';
import 'package:flutter_resume_website/main.dart';
import 'package:flutter_resume_website/widgets/widgets.dart';
import 'package:flutter_resume_website/features/about/widgets/widgets.dart';

class AboutPage extends HookWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutScrollController = useScrollController();
    final headerKey = GlobalKey();
    late final double imageScrollingBounds;
    final mQuerySize = MediaQuery.of(context).size;
    final firstHeaderTextSpacing = mQuerySize.height / 4;
    final secondHeaderTextSpacing = mQuerySize.height / 2;
    final imageTopPadding = useState(0.0);

    if (!isWebMobile) {
      useEffect(() {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          // Get height of text to figure out image scrolling bounds
          final bounds = headerKey.currentContext!.size!.height -
              (firstHeaderTextSpacing + secondHeaderTextSpacing);
          imageScrollingBounds = bounds;
        });
        // After we know the bounds let's update image's top padding
        aboutScrollController.addListener(() {
          final offset = aboutScrollController.offset;
          if (offset < imageScrollingBounds) {
            imageTopPadding.value = offset;
          } else if (offset > imageScrollingBounds) {
            imageTopPadding.value = imageScrollingBounds;
          }
        });
        return null;
      }, ['']);
    }

    return AppScaffold(
      displayBackButton: isWebMobile == false,
      scrollController: aboutScrollController,
      child: Column(
        children: [
          AboutPageHeader(headerKey, imageTopPadding.value),
          const AboutPageBody(),
          const Footer(),
        ],
      ),
    );
  }
}
