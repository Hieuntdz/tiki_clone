import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUtilsWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;

  ImageUtilsWidget({this.url = "", this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      errorWidget: (context, url, err) => Icon(Icons.error),
    );
  }
}
