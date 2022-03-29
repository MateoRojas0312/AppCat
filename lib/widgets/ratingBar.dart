
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key? key,
    required this.breeds,
  }) : super(key: key);

  final int breeds;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
              rating:
                  breeds.toDouble(),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 30.0,
              direction: Axis.horizontal,
            );
  }
}