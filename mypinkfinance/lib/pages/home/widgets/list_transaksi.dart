import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/transaksi.dart';

class ListTransaksi extends StatelessWidget {
  final List<ModelTransaksi> transaksi;
  final Function(ModelTransaksi) editTransaksi;
  final Function(ModelTransaksi) hapusTransaksi;

  const ListTransaksi({
    super.key,
    required this.transaksi,
    required this.editTransaksi,
    required this.hapusTransaksi,
  });

  @override
  Widget build(BuildContext context) {
    if (transaksi.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child: Text(
            "Tidak ada transaksi di tanggal ini",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            )
          ),
        ),
      );
    }
    return ListView.builder(
      key: ValueKey(Theme.of(context).brightness),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transaksi.length,
      itemBuilder: (context, index) {
        final trx = transaksi[index];
        final isIncome = trx.tipe == "Pemasukan";
        final showDateHeader = index == 0 ||
          transaksi[index - 1].tanggal.day != trx.tanggal.day ||
          transaksi[index - 1].tanggal.month != trx.tanggal.month ||
          transaksi[index - 1].tanggal.year != trx.tanggal.year;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDateHeader)
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 15, 0, 5),
                child: Text(
                  "${trx.tanggal.day}/${trx.tanggal.month}/${trx.tanggal.year}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
              ),
            GestureDetector(
              onTap: () {
                _showDetail(context, trx);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: isIncome
                        ? const Color.fromARGB(255, 200, 230, 201)
                        : const Color.fromARGB(255, 248, 187, 208),
                      child: Icon(
                        isIncome
                          ? Icons.arrow_downward
                          : Icons.fastfood,
                        color: isIncome
                          ? const Color.fromARGB(255, 76, 175, 79)
                          : const Color.fromARGB(255, 233, 30, 98),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trx.keterangan,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            trx.kategori,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      isIncome
                        ? "+Rp${trx.jumlah}"
                        : "-Rp${trx.jumlah}",
                      style: TextStyle(
                        color: isIncome 
                          ? const Color.fromARGB(255, 76, 175, 79) 
                          : const Color.fromARGB(255, 244, 67, 54),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDetail(BuildContext context, ModelTransaksi trx) {
    final isIncome = trx.tipe == "Pemasukan";
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 107, 156),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Detail Transaksi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: Get.back,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.category,
                      color: Color.fromARGB(255, 255, 107, 156),
                    ),
                    title: const Text("Kategori"),
                    subtitle: Text(trx.kategori),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.description,
                      color: Color.fromARGB(255, 255, 107, 156),
                    ),
                    title: const Text("Keterangan"),
                    subtitle: Text(trx.keterangan),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_today,
                      color: Color.fromARGB(255, 255, 107, 156),
                    ),
                    title: const Text("Tanggal"),
                    subtitle: Text(
                      "${trx.tanggal.day}/${trx.tanggal.month}/${trx.tanggal.year}",
                    ),
                  ),
                  if (trx.catatan != null && trx.catatan!.isNotEmpty)
                    ListTile(
                      leading: const Icon(
                        Icons.notes,
                        color: Color.fromARGB(255, 255, 107, 156),
                      ),
                      title: const Text("Catatan"),
                      subtitle: Text(trx.catatan!),
                    ),
                  const SizedBox(height: 15),
                  Text(
                    isIncome
                      ? "+Rp${trx.jumlah}"
                      : "-Rp${trx.jumlah}",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: isIncome 
                        ? const Color.fromARGB(255, 76, 175, 79) 
                        : const Color.fromARGB(255, 244, 67, 54),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Get.back();
                            editTransaksi(trx);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 255, 107, 156),
                          ),
                          label: const Text(
                            "Edit",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 107, 156),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 255, 107, 156),
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.back();
                            hapusTransaksi(trx);
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text(
                            "Hapus",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 244, 67, 54),
                            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}