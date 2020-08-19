import 'package:flutter/material.dart';
import 'package:solar_system/src/app/widgets/icons/app_icons.dart';
import 'package:solar_system/src/core/stylesheet.dart';

class Header extends StatelessWidget {
  const Header({
    this.userName = '',
    this.onPressed,
  });

  final String userName;
  final Function onPressed;

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
          onPressed: onPressed,
          icon: AppIcons.settings(color: StyleSheet.colors.brandWhite),
        ),
      ],
    );
  }
}
