import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.navigationRoute})
      : super(key: key);
  final IconData iconData;
  final String title;
  final String navigationRoute;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: Colors.lightGreenAccent),
      title:
          Text(title.tr(), style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () => Navigator.of(context).pushNamed(navigationRoute),
    );
  }
}
