import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/transaksi_controller.dart';
import 'package:pas/utils/format_rupiah.dart';

class TransaksiPage extends StatelessWidget {
  TransaksiPage({super.key});

  final controller = Get.put(TransaksiController());

  @override
  Widget build(BuildContext context) {
    final makanan = controller.makanan;

    return Scaffold(
      appBar: AppBar(title: const Text("Transaksi Pembelian")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // info makanan
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        makanan.gambar,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.fastfood, size: 60),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(makanan.namaMakanan,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(makanan.hargamakanan,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              Text('${makanan.rating}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // input jumlah
            const Text("Jumlah Makanan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Obx(
              () => Row(
                children: [
                  IconButton(
                    onPressed: controller.kurang,
                    icon: const Icon(Icons.remove_circle_outline, size: 36),
                  ),
                  Container(
                    width: 60,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('${controller.jumlah.value}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                  ),
                  IconButton(
                    onPressed: controller.tambah,
                    icon: const Icon(Icons.add_circle_outline, size: 36),
                  ),
                ],
              ),
            ),
            const Divider(height: 32),

            // rincian pembayaran
            const Text("Rincian Pembayaran",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Obx(
              () => Column(
                children: [
                  baris("Subtotal", formatRupiah(controller.subtotal)),
                  const SizedBox(height: 8),
                  baris("PPN (5%)", formatRupiah(controller.ppn)),
                  const Divider(height: 24),
                  baris("Total Bayar", formatRupiah(controller.total),
                      besar: true),
                ],
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => konfirmasi(context),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text("Bayar", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget baris(String label, String nilai, {bool besar = false}) {
    final gaya = TextStyle(
      fontSize: besar ? 18 : 15,
      fontWeight: besar ? FontWeight.bold : FontWeight.normal,
      color: besar ? Colors.green : null,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: besar ? gaya.copyWith(color: null) : gaya),
        Text(nilai, style: gaya),
      ],
    );
  }

  // dialog konfirmasi setelah tombol Bayar ditekan
  void konfirmasi(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Konfirmasi Pembayaran"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${controller.makanan.namaMakanan} x ${controller.jumlah.value}"),
              const SizedBox(height: 16),
              baris("Subtotal", formatRupiah(controller.subtotal)),
              const SizedBox(height: 8),
              baris("PPN (5%)", formatRupiah(controller.ppn)),
              const Divider(height: 24),
              baris("Total Bayar", formatRupiah(controller.total), besar: true),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }
}
