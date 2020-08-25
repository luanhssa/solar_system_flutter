import 'package:flutter/material.dart';
import 'package:solar_system/src/app/widgets/icons/app_icons.dart';
import 'package:solar_system/src/core/stylesheet.dart';
import 'package:solar_system/src/domain/entities/celestial_body.dart';

class CelestialPage extends StatefulWidget {
  @override
  _CelestialPageState createState() => _CelestialPageState();
}

class _CelestialPageState extends State<CelestialPage> {
  CelestialBody celestial;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final dynamic args = ModalRoute.of(context).settings.arguments;
    if (args is CelestialBody) {
      setState(() {
        celestial = args;
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.height * 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 414,
                        height: 280,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage('assets/images/Constellation.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(32),
                          ),
                        ),
                      ),
                      const SizedBox(height: 72),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              celestial.name,
                              style: StyleSheet.typography.homeTitle.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                AppIcons.save(),
                                const SizedBox(width: 16),
                                AppIcons.share(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            celestial.shortDescription,
                            style: StyleSheet.typography.paragraph.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Theme(
                        data: ThemeData.light().copyWith(),
                        child: ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          physics: const ClampingScrollPhysics(),
                          children: <Widget>[
                            ExpansionTile(
                              title: Text(
                                'Introdução',
                                style: StyleSheet.typography.buttonTitle.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              expandedAlignment: Alignment.centerLeft,
                              children: <Widget>[
                                Text(
                                  'Lorem Ipsum',
                                  style: StyleSheet.typography.paragraph.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Características Físicas',
                                style: StyleSheet.typography.buttonTitle.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              expandedAlignment: Alignment.centerLeft,
                              children: <Widget>[
                                Text(
                                  'Lorem Ipsum',
                                  style: StyleSheet.typography.paragraph.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Hidrologia',
                                style: StyleSheet.typography.buttonTitle.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              expandedAlignment: Alignment.centerLeft,
                              children: <Widget>[
                                Text(
                                  'Lorem Ipsum',
                                  style: StyleSheet.typography.paragraph.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Geografia',
                                style: StyleSheet.typography.buttonTitle.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              expandedAlignment: Alignment.centerLeft,
                              children: <Widget>[
                                Text(
                                  'Lorem Ipsum',
                                  style: StyleSheet.typography.paragraph.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: celestial.id,
                      child: Center(
                        child: Container(
                          width: 280,
                          height: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: StyleSheet.colors.gradientButtonRight.withOpacity(0.25),
                                offset: const Offset(0, 12),
                                blurRadius: 24,
                              ),
                            ],
                          ),
//                    padding: EdgeInsets.all(24.0),
                          child: celestial.image,
                        ),
                      ),
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: kTabLabelPadding.right),
                      child: AppIcons.settings(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
