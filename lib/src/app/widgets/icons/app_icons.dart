import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppIcons {
  static Widget asteroids({Color color}) =>
      SVGIcon(path: 'assets/icons/Asteroids.svg', color: color);

  static Widget back({Color color}) => SVGIcon(path: 'assets/icons/Back.svg', color: color);

  static Widget forward({Color color}) => SVGIcon(path: 'assets/icons/Forward.svg', color: color);

  static Widget galaxies({Color color}) => SVGIcon(path: 'assets/icons/Galaxies.svg', color: color);

  static Widget gallery({Color color}) => SVGIcon(path: 'assets/icons/Gallery.svg', color: color);

  static Widget home({Color color}) => SVGIcon(path: 'assets/icons/Home.svg', color: color);

  static Widget planets({Color color}) => SVGIcon(path: 'assets/icons/Planets.svg', color: color);

  static Widget save({Color color}) => SVGIcon(path: 'assets/icons/Save.svg', color: color);

  static Widget saveSolid({Color color}) => SVGIcon(path: 'assets/icons/Saved.svg', color: color);

  static Widget search({Color color}) => SVGIcon(path: 'assets/icons/Search.svg', color: color);

  static Widget settings({Color color}) => SVGIcon(path: 'assets/icons/Settings.svg', color: color);

  static Widget share({Color color}) => SVGIcon(path: 'assets/icons/Share.svg', color: color);

  static Widget stars({Color color}) => SVGIcon(path: 'assets/icons/Stars.svg', color: color);
}

class SVGIcon extends StatelessWidget {
  const SVGIcon({
    @required this.path,
    this.fit = BoxFit.contain,
    this.color,
  });

  final String path;
  final BoxFit fit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit,
      color: color,
    );
  }
}
