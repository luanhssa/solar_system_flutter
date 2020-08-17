import 'package:flutter/material.dart';
import 'package:solar_system/src/core/stylesheet.dart';

import 'icons/app_icons.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    @required this.image,
    @required this.name,
    @required this.description,
    this.onPressed,
  });

  final String name;
  final String description;
  final Function onPressed;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: 374,
        height: 200,
        decoration: BoxDecoration(
          color: StyleSheet.colors.brandBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Container(
              width: 220,
              height: 220,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Transform.translate(
                  offset: const Offset(-50, -30),
                  child: Container(
                    width: 220,
                    height: 220,
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
              right: 16,
              bottom: 30,
              width: 172,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        textAlign: TextAlign.left,
                        style: StyleSheet.typography.homeTitle.copyWith(
                          color: StyleSheet.colors.brandWhite,
                        ),
                      ),
                      AppIcons.save(color: StyleSheet.colors.brandWhite.withOpacity(0.65)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: StyleSheet.typography.placeholder.copyWith(
                      color: StyleSheet.colors.brandWhite.withOpacity(0.65),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Continue lendo',
                        style: StyleSheet.typography.placeholder.copyWith(
                          color: StyleSheet.colors.brandWhite.withOpacity(0.65),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 16,
                        height: 16,
                        child: AppIcons.forward(color: StyleSheet.colors.gradientButtonLeft),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
