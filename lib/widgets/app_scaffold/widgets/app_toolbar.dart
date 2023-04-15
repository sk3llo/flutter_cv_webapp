import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_website/core/router/app_router.gr.dart';
import 'package:flutter_resume_website/core/utils/app_theme.dart';
import 'package:flutter_resume_website/main.dart';
import 'package:flutter_resume_website/widgets/app_scaffold/widgets/toolbar_action.dart';
import 'package:flutter_resume_website/widgets/dividers.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';

class SliverAppToolbar extends StatelessWidget {
  const SliverAppToolbar({
    Key? key,
    required this.shouldDisplayBackButton,
    required this.toolBarVisible,
    this.backgroundColor,
    this.floatingToolBar = true,
  }) : super(key: key);

  final bool shouldDisplayBackButton;
  final bool toolBarVisible;
  final Color? backgroundColor;
  final bool floatingToolBar;

  @override
  Widget build(BuildContext context) {
    final double toolBarHeight = isWebMobile
        ? AppDimensions.mobileToolBarHeight
        : AppDimensions.desktopToolBarHeight;

    late final OverlayEntry mobileOverlay;
    mobileOverlay = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () => mobileOverlay.remove(),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: Wrap(
                children: toolbarActions(context, entry: mobileOverlay),
              ),
            ),
          ),
        );
      },
    );

    return SliverAppBar(
      floating: floatingToolBar,
      elevation: 0,
      toolbarHeight: toolBarHeight,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      leading: Container(),
      flexibleSpace: Hero(
        tag: 'toolbar',
        child: isWebMobile
            ? buildMobileToolbar(context, mobileOverlay)
            : buildDesktopToolbar(context),
      ),
    );
  }

  Widget buildMobileToolbar(BuildContext context, OverlayEntry entry) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Overlay.of(context).insert(entry),
          ),
        ),
      ),
    );
  }

  Widget buildDesktopToolbar(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: AppDimensions.toolBarVerticalPadding,
          margin: AppDimensions.mainHorizontalMargin,
          child: Row(
            children: [
              // if (shouldDisplayBackButton)
              //   const Material(color: Colors.transparent, child: BackButton()),
              leading(context),
              // if (!shouldDisplayBackButton)
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: toolbarActions(context),
                  ),
                ),
              )
            ],
          ),
        ),
        divider,
      ],
    );
  }

  Widget leading(BuildContext context) {
    return Opacity(
      opacity: !shouldDisplayBackButton ? 1 : 0,
      child: Text('${AppStrings.devFirstName} ${AppStrings.devLastName}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: !shouldDisplayBackButton ? AppTheme.primary : Colors.white)),
    );
  }

  List<Widget> toolbarActions(BuildContext context, {OverlayEntry? entry}) {
    return [
      AppToolbarAction(
        title: AppStrings.toolbarFirstAction,
        onPressed: () async {
          if (isWebMobile) {
            await context.router.replaceAll([const HomePageRoute()]);
            Timer(const Duration(milliseconds: 100), () => entry?.remove());
          } else {
            await context.router.replace(const HomePageRoute());
          }
        },
      ),
      AppToolbarAction(
        title: AppStrings.toolbarThirdAction,
        onPressed: () async {
          if (isWebMobile) {
            await context.router.replaceAll([const AboutPageRoute()]);
            Timer(const Duration(milliseconds: 100), () => entry?.remove());
          } else {
            await context.router.replace(const AboutPageRoute());
          }
        },
      ),
    ];
  }
}
