import 'package:flutter/material.dart';
import 'package:solar_system/src/app/widgets/images/app_image.dart';
import 'package:solar_system/src/core/stylesheet.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleSheet.colors.brandBackground,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: AppImages.solarSystem(),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Aperte o cinto',
                  textAlign: TextAlign.center,
                  style: StyleSheet.typography.bottomBarItem.copyWith(
                    color: StyleSheet.colors.brandWhiteOpacity,
                  ),
                ),
                Text(
                  'Comece sua jornada' '\n' 'pelo sistema solar.',
                  textAlign: TextAlign.center,
                  style: StyleSheet.typography.homeTitle.copyWith(
                    color: StyleSheet.colors.brandWhite,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 120,
            child: Column(
              children: <Widget>[
                Text(
                  'Pronto para a decolagem?',
                  textAlign: TextAlign.center,
                  style: StyleSheet.typography.bottomBarItem.copyWith(
                    color: StyleSheet.colors.brandWhiteOpacity,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 206,
                  height: 51,
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 51,
                      decoration: BoxDecoration(
                        gradient: StyleSheet.gradients.button,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: Theme.of(context).buttonTheme.padding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Começar agora',
                            style: StyleSheet.typography.buttonTitle.copyWith(
                              color: StyleSheet.colors.brandWhite,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.arrow_forward,
                            color: StyleSheet.colors.brandWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
