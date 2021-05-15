import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget shopDashboardBanner({
  @required Size size,
  @required String imagepath,
}) {
  return Positioned(
    top: 0,
    left: 0,
    child: CachedNetworkImage(
      imageUrl: imagepath,
      height: size.height * 0.35,
      width: size.width,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: Text("Loading")),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}
