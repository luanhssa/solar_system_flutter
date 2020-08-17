import 'package:flutter/material.dart';

abstract class AppImages {
  static Widget solarSystem() => AppImage(path: 'assets/images/Solar_System.png');

  static Widget constellation() => AppImage(path: 'assets/images/Constellation.png');

  static Widget earth() => AppImage(path: 'assets/images/Earth.png');

  static Widget jupiter() => AppImage(path: 'assets/images/Jupiter.png');

  static Widget mars() => AppImage(path: 'assets/images/Mars.png');

  static Widget mercury() => AppImage(path: 'assets/images/Mercury.png');

  static Widget neptune() => AppImage(path: 'assets/images/Neptune.png');

  static Widget pluto() => AppImage(path: 'assets/images/Pluto.png');

  static Widget saturn() => AppImage(path: 'assets/images/Saturn.png');

  static Widget sun() => AppImage(path: 'assets/images/Sun.png');

  static Widget uranus() => AppImage(path: 'assets/images/Uranus.png');

  static Widget venus() => AppImage(path: 'assets/images/Venus.png');
}

class AppImage extends StatelessWidget {
  const AppImage({
    @required this.path,
    this.fit = BoxFit.fitHeight,
  });

  final String path;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
    );
  }
}
