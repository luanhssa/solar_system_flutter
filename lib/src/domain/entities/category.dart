import 'package:flutter/material.dart';
import 'package:solar_system/src/app/widgets/category_card.dart';
import 'package:solar_system/src/app/widgets/icons/app_icons.dart';
import 'package:solar_system/src/core/stylesheet.dart';

Category categoryFromString(String value) {
  value ??= '';
  value = value.toLowerCase();
  switch (value) {
    case "planet":
      return Category.PLANET;
    case "asteroid":
      return Category.ASTEROID;
    case "star":
      return Category.STAR;
    case "galaxy":
      return Category.GALAXY;
    default:
      return null;
  }
}

enum Category {
  PLANET,
  ASTEROID,
  STAR,
  GALAXY,
}

extension CategoryExtension on Category {
  String get title => _categoryItem()?.title;

  Widget get icon => _categoryItem()?.icon;

  Gradient get gradient => _categoryItem()?.gradient;

  Widget get tile => _categoryItem()?.tile;

  _CategoryItem _categoryItem() {
    switch (this) {
      case Category.PLANET:
        return _CategoryItem(
          title: 'Planetas',
          icon: AppIcons.planets(color: StyleSheet.colors.brandWhite),
          gradient: StyleSheet.gradients.blue,
        );
      case Category.ASTEROID:
        return _CategoryItem(
          title: 'Asteróides',
          icon: AppIcons.asteroids(color: StyleSheet.colors.brandWhite),
          gradient: StyleSheet.gradients.pink,
        );
      case Category.STAR:
        return _CategoryItem(
          title: 'Estrelas',
          icon: AppIcons.stars(color: StyleSheet.colors.brandWhite),
          gradient: StyleSheet.gradients.cyan,
        );
      case Category.GALAXY:
        return _CategoryItem(
          title: 'Galáxias',
          icon: AppIcons.galaxies(color: StyleSheet.colors.brandWhite),
          gradient: StyleSheet.gradients.yellow,
        );
      default:
        return null;
    }
  }
}

class _CategoryItem {
  _CategoryItem({
    @required this.title,
    @required this.icon,
    @required this.gradient,
  });

  final String title;
  final Widget icon;
  final Gradient gradient;

  Widget get tile => CategoryCard(
        image: icon,
        name: title,
        gradient: gradient,
      );
}
