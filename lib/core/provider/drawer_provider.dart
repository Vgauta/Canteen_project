import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  bool _isDrawerOpen = false;
  bool _isItemDrawerMenusOpen = false;
  bool _isItemDrawerOrdersOpen = false;
  bool _isItemDrawerEditsOpen = false;
  bool _isItemDrawerAddOpen = false;



  bool _isAnimate = false;

  bool get isDrawerOpen => _isDrawerOpen;
  bool get isItemDrawerMenusOpen => _isItemDrawerMenusOpen;
  bool get isItemDrawerOrdersOpen => _isItemDrawerOrdersOpen;
  bool get isItemDrawerEditsOpen => _isItemDrawerEditsOpen;
  bool get isItemDrawerAddOpen => _isItemDrawerAddOpen;
  bool get isAnimate => _isAnimate;

  void toggleDrawer(bool isDrawerOpen) {
    _isDrawerOpen = isDrawerOpen;
    notifyListeners();
  }

  void toggleItemDrawer(bool isOpen, String text) {
    if (text == "Menus") {
      _isItemDrawerMenusOpen = isOpen;
    } else if (text == "Orders") {
      _isItemDrawerOrdersOpen = isOpen;
    }else if(text == "Edit"){
      _isItemDrawerEditsOpen = isOpen;
    }else if(text == "Add"){
      _isItemDrawerAddOpen = isOpen;
    
    }

    notifyListeners();
  }

  void toggleAnimate(bool isAnimate) {
    _isAnimate = isAnimate;
    notifyListeners();
  }
}
