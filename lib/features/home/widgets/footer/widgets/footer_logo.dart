import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/features/home/widgets/jobs_list/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/app_images.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:url_launcher/url_launcher.dart' as url;

const _logoSize = 32.0;

class FooterLogo extends HookWidget {
  const FooterLogo({Key? key, required this.logoAsset}) : super(key: key);

  final String logoAsset;

  @override
  Widget build(BuildContext context) {
    final isFocused = useState(false);

    return ImageWrapper(
        padding: const EdgeInsets.all(12),
        onImageTapped: () async {
          if (logoAsset == AppImages.gitLogo) {
            await url.launchUrl(Uri.parse(AppStrings.devGithub));
          } else {
            await url.launchUrl(Uri.parse(AppStrings.devLinkedIn));
          }
        },
        onMouseEnter: (event) {
          isFocused.value = true;
        },
        onMouseExit: (event) {
          isFocused.value = false;
        },
        image: logoAsset,
        width: _logoSize,
        height: _logoSize,
        imageDecoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              color: isFocused.value
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
              width: isFocused.value ? 3 : 1,
            ),
          ),
        ));
  }
}
