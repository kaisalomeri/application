

import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? backRoute;

  GlobalAppBar({required this.title, this.backRoute});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: 200,
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/bg.png'), // Ensure this path is correct
              fit: BoxFit.cover,
            ),
          ),
        ),
        AppBar(
          leading: backRoute != null
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (backRoute != null) {
                      Navigator.pushNamed(context, backRoute!);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                )
              : null,
          title: Text(title),
          centerTitle: true,
          backgroundColor:
              Colors.transparent, // Make the AppBar background transparent
          elevation: 0, // Remove the shadow under the AppBar
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 46);
}
