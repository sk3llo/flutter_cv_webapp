CV web app built with Flutter. 

![](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNWFlZGRkNmJhMDk5NDczYWY4YTZjY2U4MDhiY2IyMzQyMDMyNjA0ZCZjdD1n/hRIicL36fsh1NO1jig/giphy.gif)

Few things to note:

- State management with [Hooks Riverpod](https://pub.dev/packages/hooks_riverpod)
  and [Flutter Hooks](https://pub.dev/packages/flutter_hooks)
- Routing with [Auto Route](https://pub.dev/packages/auto_route)
  and [Auto Route Generator](https://pub.dev/packages/auto_route_generator)
- [Flutter Lints](https://pub.dev/packages/flutter_lints) used as a main linter
- App is using [Responsive Framework](https://pub.dev/packages/responsive_framework)
  to make the app responsive to different screen sizes
- All emojis are added in .png format to have same look when using different browsers

To adjust it to your needs follow these steps:

- Change favicon.png in ```web/``` folder
- Change images in ```assets/images/dev/``` and ```assets/images/jobs_logo/``` folders
  and define path to them in in ```lib/core/utils/const/app_images.dart```
- Change strings in ```lib/core/utils/const/app_strings.dart```
- Add your jobs description to ```lib/core/utils/const/app_jobs.dart```
- Run ```flutter pub run build_runner build```
