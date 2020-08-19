import 'package:flutter/material.dart';
import 'package:solar_system/src/core/stylesheet.dart';

import 'icons/app_icons.dart';

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
