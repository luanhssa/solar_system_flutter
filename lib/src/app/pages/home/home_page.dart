import 'package:flutter/material.dart';
import 'package:solar_system/src/app/widgets/celestial_card.dart';
import 'package:solar_system/src/app/widgets/icons/app_icons.dart';
import 'package:solar_system/src/app/widgets/images/app_image.dart';
import 'package:solar_system/src/app/widgets/search_text_field.dart';
import 'package:solar_system/src/app/widgets/session_widget.dart';
import 'package:solar_system/src/core/stylesheet.dart';
import 'package:solar_system/src/core/utils.dart';
import 'package:solar_system/src/domain/entities/category.dart';
import 'package:solar_system/src/domain/entities/celestial_body.dart';

import 'header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CelestialBody> celestialBodies = <CelestialBody>[];
  int currentPage = 0;

  final List<BarItem> barItems = <BarItem>[
    BarItem(
      activeIcon: AppIcons.home(color: StyleSheet.colors.brandWhite),
      inactiveIcon: AppIcons.home(color: StyleSheet.colors.brandWhiteOpacity),
      label: 'Home',
    ),
    BarItem(
      activeIcon: AppIcons.search(color: StyleSheet.colors.brandWhite),
      inactiveIcon: AppIcons.search(color: StyleSheet.colors.brandWhiteOpacity),
      label: 'Buscar',
    ),
    BarItem(
      activeIcon: AppIcons.save(color: StyleSheet.colors.brandWhite),
      inactiveIcon: AppIcons.save(color: StyleSheet.colors.brandWhiteOpacity),
      label: 'Salvos',
    ),
    BarItem(
      activeIcon: AppIcons.gallery(color: StyleSheet.colors.brandWhite),
      inactiveIcon: AppIcons.gallery(color: StyleSheet.colors.brandWhiteOpacity),
      label: 'Galeria',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: StyleSheet.colors.brandBackground,
          child: AppImages.constellation(),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Header(userName: 'Ana Cecília'),
                  ),
                  const SizedBox(height: 56),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SearchTextField(),
                  ),
                  const SizedBox(height: 48),
                  SessionWidget<Category>(
                    height: 80,
                    title: 'Categorias',
                    list: Category.values,
                    builder: (BuildContext context, Category category) {
                      return category.tile;
                    },
                  ),
                  const SizedBox(height: 48),
                  SessionWidget<CelestialBody>(
                    height: 190,
                    title: 'Planetas',
                    list: celestialBodies
                        .where((element) => element.category == Category.PLANET)
                        .toList(),
                    builder: (BuildContext context, CelestialBody body) {
                      return CelestialCard(celestial: body);
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: StyleSheet.colors.brandBackground,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: currentPage,
            onTap: (int page) => setState(() {
              currentPage = page;
            }),
            iconSize: 20,
            type: BottomNavigationBarType.fixed,
            items: List<BottomNavigationBarItem>.generate(barItems.length, (int index) {
              final BarItem item = barItems[index];
              return BottomNavigationBarItem(
                icon: index == currentPage ? item.activeIcon : item.inactiveIcon,
                title: Text(
                  item.label,
                  style: StyleSheet.typography.bottomBarItem.copyWith(
                    color: StyleSheet.colors.brandWhite,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _fetchCelestialBodies();
  }

  Future<void> _fetchCelestialBodies() async {
    const String jsonPath = 'assets/json/data.json';
    final Map<String, dynamic> data = await parseJsonFromAssets(jsonPath);
    final List<CelestialBody> _bodies = _listToCelestialBody(data['bodies']);
    setState(() {
      celestialBodies = _bodies;
    });
  }

  List<CelestialBody> _listToCelestialBody(List<dynamic> dataBodies) {
    final List<CelestialBody> _bodies = <CelestialBody>[];
    for (dynamic body in dataBodies) {
      _bodies.add(CelestialBody(
        id: body['id'],
        name: body['name'],
        category: body['category'],
        imagePath: body['image'],
        shortDescription: body['shortDescription'],
        description: body['description'],
      ));
      List<dynamic> bodies = body['bodies'];
      if (bodies != null) {
        _bodies.addAll(_listToCelestialBody(bodies));
      }
    }
    return _bodies;
  }
}

class BarItem {
  BarItem({
    @required this.activeIcon,
    @required this.inactiveIcon,
    @required this.label,
  });

  final Widget activeIcon;
  final Widget inactiveIcon;
  final String label;
}
