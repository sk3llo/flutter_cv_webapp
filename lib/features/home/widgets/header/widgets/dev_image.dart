import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/features/home/widgets/jobs_list/widgets/widgets.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';

enum DevImageSlideFrom { left, right }

class DevImage extends HookWidget {
  const DevImage({
    Key? key,
    required this.imageAsset,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.slideFrom = DevImageSlideFrom.left,
    this.animDuration = AppAnim.defaultAnimDuration,
  }) : super(key: key);

  final String imageAsset;
  final double? width;
  final double? height;
  final Alignment alignment;
  final DevImageSlideFrom slideFrom;
  final Duration animDuration;

  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    final imageOpacity = useState(0.0);
    late final Tween<Offset> animTween;
    if (slideFrom == DevImageSlideFrom.left) {
      animTween = Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      );
    } else {
      animTween = Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      );
    }
    final animController = useAnimationController(duration: animDuration);
    useEffect(() {
      animController.forward();
      // Launch fade effect
      Timer(const Duration(milliseconds: 400), () {
        if (isMounted()) imageOpacity.value = 1.0;
      });
      return null;
    }, ['']);

    return SlideTransition(
      position: animController.drive(animTween),
      child: AnimatedOpacity(
        duration: animDuration,
        opacity: imageOpacity.value,
        child: Align(
          // alignment: alignment,
          child: ImageWrapper(
            image: imageAsset,
            width: width ?? MediaQuery.of(context).size.width / 2,
            fit: BoxFit.cover,
            height: height ?? MediaQuery.of(context).size.height - 105,
          ),
        ),
      ),
    );
  }
}
