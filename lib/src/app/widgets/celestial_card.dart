import 'package:flutter/material.dart';
import 'package:solar_system/src/core/stylesheet.dart';
import 'package:solar_system/src/domain/entities/celestial_body.dart';

import 'icons/app_icons.dart';

class CelestialCard extends StatelessWidget {
  const CelestialCard({
    @required this.celestial,
  });

  final CelestialBody celestial;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => Navigator.of(context).pushNamed('/celestial', arguments: celestial),
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
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: celestial.id,
                        child: celestial.image,
                      ),
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
                      celestial.name,
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
