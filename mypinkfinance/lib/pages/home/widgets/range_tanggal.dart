import 'package:flutter/material.dart';

class RangeTanggal extends StatelessWidget {
  final DateTime tanggalAwal;
  final DateTime tanggalAkhir;
  final Function(DateTime) ubahTanggalAwal;
  final Function(DateTime) ubahTanggalAkhir;

  const RangeTanggal({
    super.key,
    required this.tanggalAwal,
    required this.tanggalAkhir,
    required this.ubahTanggalAwal,
    required this.ubahTanggalAkhir,
  });

  String formatTanggal(DateTime d) {
    return "${d.day}/${d.month}/${d.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 107, 156),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.date_range,
            color: Color.fromARGB(255, 255, 107, 156),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: tanggalAwal,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (picked != null) {
                ubahTanggalAwal(picked);
              }
            },
            child: Text(
              formatTanggal(tanggalAwal),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 233, 30, 98),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "—",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6), 
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: tanggalAkhir,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (picked != null) {
                ubahTanggalAkhir(picked);
              }
            },
            child: Text(
              formatTanggal(tanggalAkhir),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 233, 30, 98),
              ),
            ),
          ),
        ],
      ),
    );
  }
}