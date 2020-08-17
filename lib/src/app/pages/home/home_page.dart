import 'package:flutter/material.dart';
import 'package:solar_system/src/app/widgets/category_card.dart';
import 'package:solar_system/src/app/widgets/icons/app_icons.dart';
import 'package:solar_system/src/app/widgets/images/app_image.dart';
import 'package:solar_system/src/app/widgets/planet_card.dart';
import 'package:solar_system/src/app/widgets/result_card.dart';
import 'package:solar_system/src/core/stylesheet.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CategoryCard(
                  name: 'Planetas',
                  image: AppIcons.planets(color: StyleSheet.colors.brandWhite),
                  gradient: StyleSheet.gradients.blue,
                ),
                CategoryCard(
                  name: 'Asteróides',
                  image: AppIcons.asteroids(color: StyleSheet.colors.brandWhite),
                  gradient: StyleSheet.gradients.pink,
                ),
                CategoryCard(
                  name: 'Estrelas',
                  image: AppIcons.stars(color: StyleSheet.colors.brandWhite),
                  gradient: StyleSheet.gradients.cyan,
                ),
                CategoryCard(
                  name: 'Galáxias',
                  image: AppIcons.galaxies(color: StyleSheet.colors.brandWhite),
                  gradient: StyleSheet.gradients.yellow,
                ),
              ],
            ),
            PlanetCard(
              name: 'Sun',
              image: AppImages.sun(),
              onPressed: () {},
            ),
            ResultCard(
              name: 'Netuno',
              description:
                  'Netuno é o oitavo planeta do Sistema Solar, o último a partir do Sol desde a reclassificação dos planetas ...',
              image: AppImages.neptune(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
