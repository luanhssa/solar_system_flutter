import 'package:flutter/material.dart';
import 'package:solar_system/src/core/stylesheet.dart';

class SessionWidget<T> extends StatelessWidget {
  const SessionWidget({
    this.title = '',
    this.list = const [],
    @required this.builder,
    @required this.height,
  });

  final String title;
  final List<T> list;
  final Widget Function(BuildContext context, T t) builder;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: StyleSheet.typography.paragraph.copyWith(
              color: StyleSheet.colors.brandWhite,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: height ?? 190,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 18),
            itemBuilder: (BuildContext context, int index) {
              return builder(context, list[index]);
            },
          ),
        ),
      ],
    );
  }
}
