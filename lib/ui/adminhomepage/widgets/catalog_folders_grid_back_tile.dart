import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:flutter/material.dart';

class CatalogFolderGridBackTile extends StatelessWidget {
  final VoidFunction back;

  const CatalogFolderGridBackTile({
    required this.back,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        onTap: back,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.chevron_left),
                Text('BACK'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
