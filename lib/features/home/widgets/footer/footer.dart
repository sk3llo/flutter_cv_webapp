import 'package:flutter/material.dart';
import 'package:flutter_resume_website/core/utils/const/app_strings.dart';
import 'package:flutter_resume_website/features/home/widgets/footer/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/app_images.dart';
import 'package:flutter_resume_website/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: SizedBox(
        height: isWebMobile ? 100 : 120,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              left: 0,
              bottom: 10,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                    const TextSpan(text: 'Built with '
                    ),
                    WidgetSpan(
                      child: Image.asset(
                        AppImages.heartEmoji,
                        height: 32,
                        width: 32,
                      ),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    const TextSpan(
                      text: ' using ',
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse(AppStrings.flutterLink));
                        },
                        child: const FlutterLogo(size: 32),
                      ),
                      alignment: PlaceholderAlignment.middle,
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              right: 70.0,
              child: FooterLogo(
                logoAsset: AppImages.linkedinLogo,
              ),
            ),
            const Positioned(
              right: 0.0,
              child: FooterLogo(
                logoAsset: AppImages.gitLogo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
