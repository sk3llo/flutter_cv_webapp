import 'package:flutter/material.dart';
import 'package:flutter_resume_website/widgets/widgets.dart';
import 'package:flutter_resume_website/features/home/widgets/header/header.dart';
import 'package:flutter_resume_website/features/home/widgets/jobs_list/jobs_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeScrollController = StateProvider.autoDispose<ScrollController>((ref) {
  return ScrollController();
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.read(homeScrollController);

    return AppScaffold(
      scrollController: scrollController,
      child: Column(
        children: const <Widget>[
          Header(),
          JobsList(),
          Footer(),
        ],
      ),
    );
  }
}
