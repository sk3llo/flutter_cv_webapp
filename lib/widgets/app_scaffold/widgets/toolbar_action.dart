import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppToolbarAction extends StatelessWidget {
  const AppToolbarAction({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {

    // If route is '/' and title is HOME || route.path == title - then bold
    bool displayInBold = context.router.current.path
        .replaceAll('/', '')
        .toLowerCase() ==
        title.toLowerCase() ||
        context.router.current.path == '/' && title == 'HOME';

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: displayInBold
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
      ),
    );
  }
}
