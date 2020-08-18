import 'package:flutter/material.dart';
import 'package:solar_system/src/app/widgets/category_card.dart';
import 'package:solar_system/src/app/widgets/icons/app_icons.dart';
import 'package:solar_system/src/app/widgets/images/app_image.dart';
import 'package:solar_system/src/app/widgets/planet_card.dart';
import 'package:solar_system/src/core/stylesheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  CategoryWidget(),
                  const SizedBox(height: 48),
                  PlanetWidget(),
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

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: StyleSheet.typography.placeholder,
      cursorColor: StyleSheet.colors.brandWhite,
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: StyleSheet.colors.brandBackground,
        hintText: 'Procure planetas, asteroides e estrelas...',
        hintMaxLines: 1,
        hintStyle: StyleSheet.typography.placeholder,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AppIcons.search(color: StyleSheet.colors.brandWhite),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final List<CategoryItem> categories = <CategoryItem>[
    CategoryItem(
      title: 'Planetas',
      icon: AppIcons.planets(color: StyleSheet.colors.brandWhite),
      gradient: StyleSheet.gradients.blue,
    ),
    CategoryItem(
      title: 'Asteróides',
      icon: AppIcons.asteroids(color: StyleSheet.colors.brandWhite),
      gradient: StyleSheet.gradients.pink,
    ),
    CategoryItem(
      title: 'Estrelas',
      icon: AppIcons.stars(color: StyleSheet.colors.brandWhite),
      gradient: StyleSheet.gradients.cyan,
    ),
    CategoryItem(
      title: 'Galáxias',
      icon: AppIcons.galaxies(color: StyleSheet.colors.brandWhite),
      gradient: StyleSheet.gradients.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Categorias',
          style: StyleSheet.typography.paragraph.copyWith(
            color: StyleSheet.colors.brandWhite,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 80,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 18),
            itemBuilder: (BuildContext context, int index) {
              final CategoryItem category = categories[index];
              return category.tile;
            },
          ),
        ),
      ],
    );
  }
}

class CategoryItem {
  CategoryItem({
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

class PlanetWidget extends StatelessWidget {
  final List<PlanetItem> planets = <PlanetItem>[
    PlanetItem(
      title: 'Mercúrio',
      icon: AppImages.mercury(),
      onPressed: () {},
    ),
    PlanetItem(
      title: 'Vênus',
      icon: AppImages.venus(),
      onPressed: () {},
    ),
    PlanetItem(
      title: 'Terra',
      icon: AppImages.earth(),
      onPressed: () {},
    ),
    PlanetItem(
      title: 'Marte',
      icon: AppImages.mars(),
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Planetas',
            style: StyleSheet.typography.paragraph.copyWith(
              color: StyleSheet.colors.brandWhite,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
//          width: 140,
          height: 190,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: planets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 18),
            itemBuilder: (BuildContext context, int index) {
              final PlanetItem planet = planets[index];
              return planet.tile;
            },
          ),
        ),
      ],
    );
  }
}

class PlanetItem {
  PlanetItem({
    @required this.title,
    @required this.icon,
    this.onPressed,
  });

  final String title;
  final Widget icon;
  final Function onPressed;

  Widget get tile => PlanetCard(
        image: icon,
        name: title,
        onPressed: onPressed,
      );
}

class Header extends StatelessWidget {
  const Header({this.userName = ''});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Olá',
                style: StyleSheet.typography.homeTitle,
                children: <InlineSpan>[
                  if (userName.isNotEmpty)
                    TextSpan(
                      text: ', ',
                    ),
                  if (userName.isNotEmpty)
                    TextSpan(
                      text: userName,
                      style: StyleSheet.typography.homeTitle.copyWith(
                        foreground: Paint()
                          ..shader = StyleSheet.gradients.pink.createShader(
                            Rect.fromLTWH(0.0, 0.0, userName.length.toDouble(),
                                StyleSheet.typography.homeTitle.fontSize),
                          ),
                      ),
                    ),
                ],
              ),
            ),
            Text(
              'O que voceê vai aprender hoje?',
              style: StyleSheet.typography.paragraph.copyWith(
                color: StyleSheet.colors.brandWhiteOpacity,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: AppIcons.settings(color: StyleSheet.colors.brandWhite),
        ),
      ],
    );
  }
}
