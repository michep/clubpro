import 'package:flutter/material.dart';

class AppMenu {
  final Widget? header;
  final List<AppMenuItem> items;
  final List<AppMenuItem>? bottomItems;

  AppMenu({
    required this.items,
    this.header,
    this.bottomItems,
  });

  Widget renderColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                    child: header!,
                  ),
                ),
              ),
            ],
          ),
        ...items.map(
          (e) => ListTile(
            leading: Icon(e.icon),
            title: e.title,
            onTap: e.action,
          ),
        ),
        const Spacer(),
        if (bottomItems != null)
          ...bottomItems!.map(
            (e) => ListTile(
              leading: Icon(e.icon),
              title: e.title,
              onTap: e.action,
            ),
          ),
      ],
    );
  }
}

typedef VoidFunction = void Function();

class AppMenuItem {
  final Widget title;
  final IconData icon;
  final VoidFunction? action;

  AppMenuItem({
    required this.title,
    required this.icon,
    this.action,
  });
}
