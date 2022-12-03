import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final String defaultContent;
  final double defaultRadius;
  final double defaultFontSize;
  final double width;
  final double height;

  const CachedImage({
    Key? key,
    required this.imageUrl,
    required this.defaultContent,
    this.defaultRadius = 24,
    this.defaultFontSize = 14,
    this.width = 48,
    this.height = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheKey: imageUrl?.split('?')[0],
      imageUrl: imageUrl == null ? '' : imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => DefaultImage(
        fontSize: defaultFontSize,
        content: defaultContent,
        radius: defaultRadius,
      ),
      errorWidget: (context, url, error) => DefaultImage(
        fontSize: defaultFontSize,
        content: defaultContent,
        radius: defaultRadius,
      ),
    );
  }
}

class DefaultImage extends StatelessWidget {
  final String content;
  final double radius;
  final double fontSize;

  const DefaultImage({
    Key? key,
    required this.content,
    required this.radius,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: VarText(
        color: AppColors.white,
        size: fontSize,
        text: content,
      ),
      backgroundColor: AppColors.primary,
      radius: radius,
    );
  }
}
