class ModelTransaksi {
  final int? id;
  final String? userId;
  final int jumlah;
  final String keterangan;
  final DateTime tanggal;
  final String kategori;
  final String tipe;
  final String? catatan;

  ModelTransaksi({
    this.id,
    this.userId,
    required this.jumlah,
    required this.keterangan,
    required this.tanggal,
    required this.kategori,
    required this.tipe,
    this.catatan,
  });

  factory ModelTransaksi.fromJson(Map<String, dynamic> json) {
    return ModelTransaksi(
      id: json['id'],
      userId: json['user_id'],
      jumlah: json['jumlah'],
      keterangan: json['keterangan'],
      tanggal: DateTime.parse(json['tanggal']),
      kategori: json['kategori'],
      tipe: json['tipe'],
      catatan: json['catatan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'jumlah': jumlah,
      'keterangan': keterangan,
      'tanggal': tanggal.toIso8601String(),
      'kategori': kategori,
      'tipe': tipe,
      'catatan': catatan,
    };
  }
}