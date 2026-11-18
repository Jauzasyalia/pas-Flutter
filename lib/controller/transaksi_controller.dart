import 'package:get/get.dart';
import 'package:pas/model/makanan_model.dart';

class TransaksiController extends GetxController {
  final MakananModel makanan = Get.arguments as MakananModel;

  var jumlah = 1.obs;

  void tambah() {
    jumlah.value++;
  }

  void kurang() {
    if (jumlah.value > 1) {
      jumlah.value--;
    }
  }

  // Subtotal = harga x jumlah
  int get subtotal => makanan.hargaAngka * jumlah.value;

  // PPN 5% = subtotal x 0.05
  double get ppn => subtotal * 0.05;

  // Total = subtotal + PPN
  double get total => subtotal + ppn;
}
