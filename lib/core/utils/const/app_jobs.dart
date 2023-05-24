import 'package:flutter_resume_website/core/utils/app_images.dart';
import 'package:flutter_resume_website/features/home/widgets/jobs_list/widgets/widgets.dart';

abstract class AppJobs {
  static const listOfJobs = [
    Job(
      imageAsset: AppImages.ncubeLogo,
      companyName: 'NCube',
      description: 'Dart/Flutter Developer',
      flippedDescription: "Was leading development of the mobile app for "
          "educational institution. The app had to be cross-platform and run "
          "on phones, tablets and laptops. Orientation (Portrait/Landscape) "
          "and platform-based differences were also supported. App was "
          "localized into different languages and had accessibility features "
          "such as large fonts and screen readers.",
    ),
    Job(
      imageAsset: AppImages.altamiraLogo,
      companyName: 'Altamira',
      description: 'Dart/Flutter Developer',
      flippedDescription: "Helped to architecture, build and improve several "
        "mobile applications. Was mentoring junior and middle developers during "
        "their daily tasks or when they are stuck. From time to time was holding "
        "presentations to display completed app features and discuss possible "
        "caveats and improvements.",
    ),
    Job(
      imageAsset: AppImages.globaldevLogo,
      companyName: 'Globaldev Group',
      description: 'Dart/Flutter Developer',
      flippedDescription:
          "Created and developed an app to help women track their health "
          "when taking birth control pills. Mostly cloud based, which means a "
          "lot of data (texts, images, colors) was coming from the server. "
          "We used JWT for authorization and further communication with the "
          "server, encrypted local storage, implicit "
          "animations, push notifications, localization and so on.",
    ),
    Job(
      imageAsset: AppImages.catLogo,
      companyName: 'Caterpillar',
      description: 'Dart/Flutter Developer',
      flippedDescription: "Worked on two different Flutter projects. First one "
          "was an internal application for employees to help them onboard, "
          "communicate with the management, request days off etc. Used AWS as "
          "a backend, modular architecture, localization, push notifications, "
          "Camera API, image compressing. Second app needed to connect with "
          "your engine to wirelessly transfer data to your mobile device."
          " For that we’ve built a custom bluetooth library. Also the "
          "app required location permissions.",
    ),
    Job(
      imageAsset: AppImages.huckLogo,
      companyName: 'Huck Adventures',
      description: 'Dart/Flutter Developer',
      flippedDescription: "Helped develop an application to search for and find "
          "the right partner "
          "with similar skills and interests. Prefer groups? Connect with a "
          "whole community of outdoor enthusiasts through Huck’s events and "
          "trips. Everything you need to meet people, build friendships and "
          "join a community of like-minded adventurers is here, so you’ll never "
          "have to go solo again.",
    ),
    Job(
      imageAsset: AppImages.taxmeLogo,
      companyName: 'Taxme',
      description: 'Dart/Flutter Developer',
      flippedDescription: "The Taxme app is a system designed for managing "
          "clients in accounting firms. The system enables control and monitoring"
          " of all reports of the firm's clients to the tax authorities, "
          "as well as saving data and presenting them to the client at any given "
          "time. Used native Flutter components to build graphs and charts, "
          "used Firestore as a backend and sqflite to save data locally.",
    ),
    Job(
      imageAsset: AppImages.bunqLogo,
      companyName: 'Bunq',
      description: 'Android Developer',
      flippedDescription: "Duties included refactoring existing codebase from "
          "Java to Kotlin, fixing bugs and writing unit tests. Was present on "
          "discussions regarding features implementation, where gained a lot of "
          "experience. Also communicated tightly with the senior developers "
          "if something was unclear.",
    ),
  ];
}
