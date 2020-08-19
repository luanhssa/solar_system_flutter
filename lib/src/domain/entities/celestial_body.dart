import 'package:flutter/widgets.dart' show Image, Container, Widget, required;

import 'category.dart';

class CelestialBody {
  CelestialBody({
    @required this.id,
    @required this.name,
    @required this.shortDescription,
    this.description = '',
    this.imagePath = '',
    @required String category,
    this.bodies = const <CelestialBody>[],
  }) : category = categoryFromString(category);

  final String id;
  final String name;
  final String shortDescription;
  final String description;
  final String imagePath;
  final Category category;
  final List<CelestialBody> bodies;

  Widget get image => imagePath.isEmpty
      ? Container()
      : imagePath.contains('http') ? _loadNetworkImage() : _loadLocalAsset();

  Widget _loadNetworkImage() {
    return Image.network(imagePath);
  }

  Widget _loadLocalAsset() {
    return Image.asset(imagePath);
  }
}
