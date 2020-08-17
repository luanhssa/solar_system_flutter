import 'package:flutter/material.dart';
import 'package:solar_system/src/core/stylesheet.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    @required this.name,
    @required this.image,
    @required this.gradient,
  });

  final LinearGradient gradient;

  final Widget image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: gradient,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 32,
            height: 32,
            child: image,
          ),
          Text(
            name,
            overflow: TextOverflow.visible,
            style: StyleSheet.typography.placeholder.copyWith(
              color: StyleSheet.colors.brandWhite,
            ),
          ),
        ],
      ),
    );
  }
}
