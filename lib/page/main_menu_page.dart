import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/main_menu_controller.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(controller.listTitles[controller.selectedIndex.value]),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          items: [
            for (int i = 0; i < controller.listTitles.length; i++)
              BottomNavigationBarItem(
                icon: Icon(controller.listIcons[i]),
                label: controller.listTitles[i],
              ),
          ],
        ),
      ),
    );
  }
}
