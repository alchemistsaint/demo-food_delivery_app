import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  RatingStars(this.rating);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int x = 0; x < rating; x++) {
      stars.add(Icon(
        Icons.star,
        color: Colors.yellow[900],
      ));
    }

    return Container(
      child: Row(
        children: stars,
      ),
    );
  }
}