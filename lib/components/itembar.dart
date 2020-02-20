import 'package:flutter/material.dart';

class ItemBar extends BottomNavigationBarItem{
  ItemBar(String iconname,String title):super(icon:Image.asset("assets/images/tabbar/$iconname.png",
    width: 50,
  ),
    activeIcon:Image.asset("assets/images/tabbar/${iconname}_active.png",
      width: 50,
    ),
    title:Text(title)
  );
}
