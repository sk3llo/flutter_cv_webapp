import 'package:flutter/material.dart';
import 'package:flutter_resume_website/core/router/app_router.dart';
import 'package:flutter_resume_website/core/utils/app_theme.dart';
import 'package:flutter_resume_website/core/utils/const/app_strings.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

bool isWebMobile = false;

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyWebsiteApp());
}

class MyWebsiteApp extends StatelessWidget {
  const MyWebsiteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      if (c.maxWidth < 800) isWebMobile = true;

      return ProviderScope(
        child: MaterialApp.router(
          title: '${AppStrings.devFirstName} ${AppStrings.devLastName}',
          theme: AppTheme.getThemeData,
          builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          debugShowCheckedModeBanner: false,
        ),
      );
    });
  }
}
