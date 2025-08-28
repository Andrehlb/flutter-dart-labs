import 'package:flutter/material.dart';

class NetworkImageWithFallback extends StatelessWidget {
  final String networkUrl;
  final String? fallbackAsset;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const NetworkImageWithFallback({
    super.key,
    required this.networkUrl,
    this.fallbackAsset,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.network(
      networkUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        // Se falhar e houver imagem local, usa ela
        if (fallbackAsset != null) {
          return Image.asset(
            fallbackAsset!,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              // Se a imagem local também falhar, mostra ícone
              return Container(
                width: width,
                height: height,
                color: Colors.grey,
                child: Icon(
                  Icons.broken_image,
                  color: Colors.white,
                  size: width * 0.3,
                ),
              );
            },
          );
        } else {
          // Se não houver imagem local, mostra ícone
          return Container(
            width: width,
            height: height,
            color: Colors.grey,
            child: Icon(
              Icons.broken_image,
              color: Colors.white,
              size: width * 0.3,
            ),
          );
        }
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
