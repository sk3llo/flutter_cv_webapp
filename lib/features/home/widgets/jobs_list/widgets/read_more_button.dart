import 'package:flutter/material.dart';
import 'package:flutter_resume_website/core/utils/const/app_strings.dart';
import 'package:flutter_resume_website/main.dart';

class ReadButton extends StatelessWidget {
  const ReadButton({
    Key? key,
    required this.onPressed,
    this.readMore = true,
  }) : super(key: key);

  final Function onPressed;
  final bool readMore;

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return MouseRegion(
          onHover: (event) => setState(() => hover = true),
          onExit: (event) => setState(() => hover = false),
          child: OutlinedButton(
            onPressed: onPressed as void Function()?,
            style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 2)),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20),
              ),
              fixedSize: MaterialStateProperty.all(
                const Size.fromWidth(320),
              ),
              overlayColor: MaterialStateProperty.all(
                Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(isWebMobile ? .1 : 1),
              ),
            ),
            child: Text(
              readMore ? AppStrings.readMoreButton : AppStrings.readLessButton,
              style: TextStyle(
                  fontSize: 14,
                  color: !isWebMobile && hover
                      ? Colors.white
                      : Theme.of(context).colorScheme.primaryContainer,
                  letterSpacing: 1),
            ),
          ),
        );
      },
    );
  }
}
