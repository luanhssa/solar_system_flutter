import 'package:flutter/material.dart';
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
      body: Center(
        child: Hero(
          transitionOnUserGestures: true,
          tag: celestial.id,
          child: celestial.image,
        ),
      ),
    );
  }
}
