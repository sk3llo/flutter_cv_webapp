import 'package:flutter/material.dart';
import 'package:flutter_resume_website/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.child,
    this.scrollController,
    this.backgroundColor,
    this.toolbarBackgroundColor,
    this.floatingToolBar = true,
    this.toolBarVisible = true,
    this.displayBackButton = false,
  }) : super(key: key);

  final Widget child;
  final Color? backgroundColor;
  final Color? toolbarBackgroundColor;
  final bool floatingToolBar;
  final bool toolBarVisible;
  final bool displayBackButton;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:
      //     backgroundColor ?? Theme.of(context).colorScheme.background,
      appBar: PreferredSize(preferredSize: Size.zero, child: Container()),
      body: CustomScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          if (toolBarVisible)
            SliverAppToolbar(
              shouldDisplayBackButton: displayBackButton,
              toolBarVisible: toolBarVisible,
              floatingToolBar: floatingToolBar,
              backgroundColor: toolbarBackgroundColor,
            ),
          SliverToBoxAdapter(
            child: Container(
              margin: AppDimensions.mainHorizontalMargin,
              padding: AppDimensions.paddingTop12,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
