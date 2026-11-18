import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/list_makanan_controller.dart';
import 'package:pas/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListmakananController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Daftar Menu Makanan",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        // tinggi dibatasi biar ListView horizontal bisa tampil
        SizedBox(
          height: 240,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.listMakanan.length,
              itemBuilder: (context, index) {
                final makanan = controller.listMakanan[index];

                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.detail_makanan, arguments: makanan);
                  },
                  child: Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            makanan.gambar,
                            height: 150,
                            width: 160,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 150,
                              color: Colors.grey[300],
                              child: const Icon(Icons.fastfood),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          makanan.namaMakanan,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          makanan.hargamakanan,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
