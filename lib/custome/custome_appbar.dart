import 'package:flutter/material.dart';
import 'package:macarrierepro/utils/colors.dart';

class AppBarCustome extends StatelessWidget implements PreferredSizeWidget {
  String title;

  AppBarCustome({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: principale.withOpacity(.2),
      automaticallyImplyLeading: false,
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
