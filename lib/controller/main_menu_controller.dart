import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/Menu/feat.dart';
import 'package:pas/Menu/home.dart';
import 'package:pas/Menu/profile.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> listPages = const [HomePage(), FeatPage(), ProfilePage()];

  final List<String> listTitles = const ["Home", "Feat", "Profile"];

  final List<IconData> listIcons = const [
    Icons.home_outlined,
    Icons.sports_soccer_outlined,
    Icons.person_outline,
  ];
}