import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../add_page/add_page.dart';
import '../home_controller.dart';
import 'kalendar.dart';
import 'list_transaksi.dart';
import 'range_tanggal.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      Widget child;
      if (controller.viewMode.value == HomeViewMode.kalender) {
        child = Column(
          key: const ValueKey("kalender"),
          children: [
            Kalendar(
              pilihHari: controller.pilihHari.value,
              fokusHari: controller.fokusHari.value,
              hariDipilih: controller.ubahHari,
            ),
            const SizedBox(height: 15),
            Obx(() {
              final pemasukan = controller.totalPemasukanHariIni;
              final pengeluaran = controller.totalPengeluaranHariIni;
              final selisih = controller.selisihHariIni;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dailyItem(
                      icon: Icons.arrow_downward,
                      label: "Masuk",
                      value: pemasukan,
                      color: const Color.fromARGB(255, 76, 175, 79),
                    ),
                    _dailyItem(
                      icon: Icons.arrow_upward,
                      label: "Keluar",
                      value: pengeluaran,
                      color: const Color.fromARGB(255, 244, 67, 54),
                    ),
                    _dailyItem(
                      icon: Icons.analytics,
                      label: "Selisih",
                      value: selisih,
                      color: selisih >= 0 ? const Color.fromARGB(255, 33, 149, 243) : const Color.fromARGB(255, 255, 153, 0),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 15),
            Obx(() => ListTransaksi(
              transaksi: controller.filterTransaksi,
              editTransaksi: (data) async {
                final result = await Get.to(
                  () => AddPage(existingData: data),
                );
                if (result != null) {
                  controller.tambahAtauEdit(result, data);
                }
              },
              hapusTransaksi: (data) {
                controller.konfirmasiHapus(data);
              },
            ))
          ],
        );
      } else {
        child = Column(
          key: const ValueKey("transaksi"),
          children: [
            RangeTanggal(
              tanggalAwal: controller.tanggalAwal.value,
              tanggalAkhir: controller.tanggalAkhir.value,
              ubahTanggalAwal: controller.ubahTanggalAwal,
              ubahTanggalAkhir: controller.ubahTanggalAkhir,
            ),
            ListTransaksi(
              transaksi: controller.rangeTransaksi,
              editTransaksi: (data) async {
                final result = await Get.to(
                  () => AddPage(existingData: data),
                );
                if (result != null) {
                  controller.tambahAtauEdit(result, data);
                }
              },
              hapusTransaksi: (data) {
                controller.konfirmasiHapus(data);
              },
            )
          ],
        );
      }
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          final slide = Tween(
            begin: const Offset(0.2, 0),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: slide,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: child,
      );
    });
  }

  Widget _dailyItem({
    required IconData icon,
    required String label,
    required int value,
    required Color color,
  }) {
    return Expanded(
      child: Builder(
        builder: (context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.06),
                  blurRadius: 8,
                )
              ],
            ),
            child: Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 158, 158, 158),
                  ),
                ),
                const Spacer(),
                Text(
                  "Rp $value",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}