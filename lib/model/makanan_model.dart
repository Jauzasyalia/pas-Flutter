class MakananModel {
  final String namaMakanan;
  final String hargamakanan; // contoh: "Rp 15.000"
  final String gambar; // URL gambar atau path asset
  final String desc;
  final double rating;
  final String review;

  MakananModel({
    required this.namaMakanan,
    required this.hargamakanan,
    required this.gambar,
    required this.desc,
    required this.rating,
    required this.review,
  });

  /// Harga dalam angka, diambil dari teks "Rp 15.000" -> 15000
  int get hargaAngka =>
      int.tryParse(hargamakanan.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
}
