import 'package:flutter/widgets.dart';

class RemoteFadeImage extends StatelessWidget {
  const RemoteFadeImage(
    this.image,
    this.width, {
    Key? key,
    this.imageRatio = 1.618,
    this.placeholder = "",
  }) : super(key: key);
  final String image;
  final double width;
  final double imageRatio;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    double height = imageRatio * width;

    return FadeInImage.assetNetwork(
      image: image,
      placeholder: placeholder,
      width: width,
      height: height,
      fit: BoxFit.cover,
      fadeOutDuration: const Duration(milliseconds: 100),
      fadeInDuration: const Duration(milliseconds: 200),
    );
  }
}
