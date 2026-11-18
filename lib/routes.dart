import 'package:get/get.dart';
import 'package:pas/page/detail_makanan_page.dart';
import 'package:pas/page/list_makanan_page.dart';
import 'package:pas/page/login_page.dart';
import 'package:pas/page/main_menu_page.dart';
import 'package:pas/page/transaksi_page.dart';

class Routes {
  static const String list_makanan = '/list_makanan';
  static const String login = '/login';
  static const String detail_makanan = "/detail_makanan";
  static const String main_menu = "/main_menu";
  static const String transaksi = "/transaksi";

  // untuk di daftarkan di main dart
  static final myPages = [
    GetPage(name: list_makanan, page: () => ListMakananPage()),
    GetPage(name: detail_makanan, page: () => const DetailMakananPage()),
    GetPage(name: main_menu, page: () => MainMenuPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: transaksi, page: () => TransaksiPage()),
  ];
}
