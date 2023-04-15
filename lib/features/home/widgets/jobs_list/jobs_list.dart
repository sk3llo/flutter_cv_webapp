import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_resume_website/features/home/home_page.dart';
import 'package:flutter_resume_website/core/utils/const/const.dart';
import 'package:flutter_resume_website/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobsList extends HookConsumerWidget {
  const JobsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const jobs = AppJobs.listOfJobs;
    final homeController = ref.watch(homeScrollController);
    final state = useState(<bool>[]);
    final animKey = useState(GlobalKey<AnimatedListState>());

    useEffect(() {
      homeController.addListener(
        () {
          listenToScrollChanges(
            homeController.offset,
            state.value,
            animKey.value,
          );
        },
      );
      return null;
    }, ['']);

    return AnimatedList(
      key: animKey.value,
      physics: const NeverScrollableScrollPhysics(),
      initialItemCount: jobs.length,
      shrinkWrap: true,
      itemBuilder: (context, pos, anim) {
        if (pos < jobs.length) {
          return Opacity(
            opacity: state.value.length - 1 >= pos ? 1 : 0,
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(anim),
              child: SlideTransition(
                position: Tween(
                  // Every second item slides from the left
                  begin: Offset(pos % 2 == 0 ? 1 : -1, 0),
                  end: const Offset(0, 0),
                ).animate(anim),
                child: jobs[pos],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void listenToScrollChanges(
    double offset,
    List<bool> state,
    GlobalKey<AnimatedListState> animKey,
  ) {
    final currentHeight = isWebMobile
        ? AppDimensions.mobileJobWidgetHeight + 180
        : AppDimensions.desktopJobWidgetHeight;
    final currentMaxOffset = (currentHeight - 50) * (state.length + 1);

    if (offset > currentMaxOffset) {
      animKey.currentState!
          .insertItem(state.length, duration: AppAnim.defaultAnimDuration);
      final updatedList = state..add(false);
      // in order to update list it has to be reassigned
      state = updatedList;
    }
  }
}
