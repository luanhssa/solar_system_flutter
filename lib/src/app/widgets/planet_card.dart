import 'package:flutter/material.dart';
import 'package:solar_system/src/core/stylesheet.dart';

import 'icons/app_icons.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({
    @required this.name,
    @required this.image,
    this.onPressed,
  });

  final String name;
  final Function onPressed;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: 140,
        height: 190,
        decoration: BoxDecoration(
          color: StyleSheet.colors.brandBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: 140,
              height: 190,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Transform.translate(
                  offset: const Offset(-30, -54),
                  child: Container(
                    width: 164,
                    height: 164,
                    child: FittedBox(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.cover,
                      child: image,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 16,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      name,
                      style: StyleSheet.typography.paragraph.copyWith(
                        color: StyleSheet.colors.brandWhite,
                      ),
                    ),
                    AppIcons.forward(color: StyleSheet.colors.gradientButtonLeft),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
