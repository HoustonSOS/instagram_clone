import 'package:flutter/material.dart';


class MyBottomBar extends StatelessWidget implements PreferredSizeWidget{
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black,);
  }
}
