import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratingBar({
  @required BuildContext context,
  @required double initialRating,
}) {
  return RatingBar.builder(
    ignoreGestures: true,
    initialRating: initialRating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.only(right: 2),
    itemSize: 22,
    itemBuilder: (context, _) => Icon(
      Icons.star_rounded,
      color: Colors.amber,
    ),
    onRatingUpdate: (double value) {
      print(value);
    },
  );
}
