import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/features/home/widgets/jobs_list/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:flutter_resume_website/main.dart';

class JobDescription extends HookWidget {
  const JobDescription({
    Key? key,
    required this.title,
    required this.description,
    required this.flippedDescription,
  }) : super(key: key);

  final String title;
  final String description;
  final String flippedDescription;

  @override
  Widget build(BuildContext context) {
    final flipController =
        useAnimationController(duration: AppAnim.defaultAnimDuration);
    final flipAnimValue =
        useAnimation(Tween(end: 1.0, begin: 0.0).animate(flipController));
    final isFlipped = flipAnimValue >= .5;

    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(pi * flipAnimValue),
      child: !isFlipped
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo image substitute text title on mobile devices
                isWebMobile ? Container() : buildTitle(context, title),
                buildDescription(context, description),
                buildButton(flipController, isFlipped),
              ],
            )
          // Mirror text to flip
          : Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(pi * 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildDescription(context, flippedDescription),
                  buildButton(flipController, isFlipped),
                ],
              ),
            ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Padding(
      padding: AppDimensions.paddingBottom12,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget buildDescription(BuildContext context, String description) {
    return Padding(
      padding: AppDimensions.paddingBottom16.copyWith(
        left: AppDimensions.mainHorizontalMargin.left,
        right: AppDimensions.mainHorizontalMargin.right,
      ),
      child: Text(
        description,
        textAlign: isWebMobile ? TextAlign.justify : TextAlign.left,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget buildButton(AnimationController flipController, bool isFlipped) {
    return ReadButton(
      readMore: !isFlipped,
      onPressed: () {
        final status = flipController.status;
        if (status == AnimationStatus.dismissed) {
          flipController.forward();
        } else {
          flipController.reverse();
        }
      },
    );
  }
}
