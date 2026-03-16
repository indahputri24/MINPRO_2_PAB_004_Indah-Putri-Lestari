import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/transaksi.dart';
import '/service/supabase_service.dart';
import '../../notifikasi/notifier.dart';

enum HomeViewMode {
  kalender,
  transaksi,
}

class HomeController extends GetxController {
  final SupabaseService service = SupabaseService();
  final pilihHari = DateTime.now().obs;
  final fokusHari = DateTime.now().obs;
  final tanggalAwal = DateTime.now().obs;
  final tanggalAkhir = DateTime.now().obs;
  final viewMode = HomeViewMode.kalender.obs;
  final transaksi = <ModelTransaksi>[].obs;
  final showSaldo = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTransaksi();
  }

  void ubahMode(HomeViewMode mode) {
    viewMode.value = mode;
  }

  void toggleSaldo() {
    showSaldo.value = !showSaldo.value;
  }

  Future<void> loadTransaksi() async {
    try {
      final data = await service.getTransaksi();
      transaksi.assignAll(data);
      transaksi.sort((a, b) => b.tanggal.compareTo(a.tanggal));
    } catch (e) {
      Notifier.error(
        "Gagal Memuat Data",
        e.toString(),
      );
    }
  }

  List<ModelTransaksi> get filterTransaksi =>
      transaksi.where((trx) =>
          trx.tanggal.year == pilihHari.value.year &&
          trx.tanggal.month == pilihHari.value.month &&
          trx.tanggal.day == pilihHari.value.day
      ).toList();

  List<ModelTransaksi> get rangeTransaksi =>
      transaksi.where((trx) =>
          trx.tanggal.isAfter(
              tanggalAwal.value.subtract(const Duration(days: 1))) &&
          trx.tanggal.isBefore(
              tanggalAkhir.value.add(const Duration(days: 1)))
      ).toList();

  int _sumByType(List<ModelTransaksi> list, String type) {
    return list
        .where((e) => e.tipe == type)
        .fold(0, (sum, e) => sum + e.jumlah);
  }
  
  int get totalPemasukan => _sumByType(transaksi, "Pemasukan");
  int get totalPengeluaran => _sumByType(transaksi, "Pengeluaran");
  int get totalPemasukanHariIni => _sumByType(filterTransaksi, "Pemasukan");
  int get totalPengeluaranHariIni => _sumByType(filterTransaksi, "Pengeluaran");
  int get selisihHariIni => totalPemasukanHariIni - totalPengeluaranHariIni;

  Future<void> tambahAtauEdit(ModelTransaksi data, [ModelTransaksi? lama]) async {
    try {
      if (lama == null) {
        await service.tambahTransaksi(data);
        Notifier.success(
          "Transaksi Ditambahkan 💰",
          "Data berhasil disimpan.",
        );
      } else {
        await service.updateTransaksi(data);
        Notifier.info(
          "Transaksi Diperbarui",
          "Perubahan berhasil disimpan.",
        );
      }
      await loadTransaksi();
    } catch (e) {
      Notifier.error(
        "Operasi Gagal",
        e.toString(),
      );
    }
  }

  Future<void> konfirmasiHapus(ModelTransaksi trx) async {
    final konfirmasi = await Get.dialog<bool>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          "Hapus Transaksi?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Apakah kamu yakin ingin menghapus transaksi ini?",
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 244, 67, 54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Get.back(result: true),
            child: const Text(
              "Hapus",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ],
      ),
    );
    if (konfirmasi == true) {
      await hapus(trx);
    }
  }

  Future<void> hapus(ModelTransaksi trx) async {
    try {
      if (trx.id == null) return;
      await service.deleteTransaksi(trx.id!);
      Notifier.success(
        "Transaksi Dihapus 🗑️",
        "Data berhasil dihapus.",
      );
      await loadTransaksi();
    } catch (e) {
      Notifier.error(
        "Gagal Menghapus",
        e.toString(),
      );
    }
  }

  void ubahHari(DateTime dipilih, DateTime fokus) {
    pilihHari.value = dipilih;
    fokusHari.value = fokus;
  }

  void ubahTanggalAwal(DateTime d) {
    tanggalAwal.value = d;
  }

  void ubahTanggalAkhir(DateTime d) {
    tanggalAkhir.value = d;
  }
}