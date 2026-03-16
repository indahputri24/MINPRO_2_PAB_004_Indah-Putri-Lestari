import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/home_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 107, 156),
            Color.fromARGB(255, 255, 143, 177),
            Color.fromARGB(255, 255, 193, 214),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Obx(() {
            final saldo = controller.totalPemasukan - controller.totalPengeluaran;
            final isVisible = controller.showSaldo.value;
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withValues(alpha: 0.15),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Color.fromARGB(255, 255, 107, 156),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Saldo Saat Ini",
                        style: TextStyle(
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isVisible ? "Rp $saldo" : "Rp ******",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: controller.toggleSaldo,
                        icon: Icon(
                          isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                          color: const Color.fromARGB(255, 158, 158, 158),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Divider(color: Theme.of(context).dividerColor),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoItem(
                        icon: Icons.arrow_downward,
                        label: "Pemasukan",
                        value: controller.totalPemasukan,
                        color: const Color.fromARGB(255, 76, 175, 79),
                        isVisible: isVisible,
                      ),
                      _infoItem(
                        icon: Icons.arrow_upward,
                        label: "Pengeluaran",
                        value: controller.totalPengeluaran,
                        color: const Color.fromARGB(255, 244, 67, 54),
                        isVisible: isVisible,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _infoItem({
    required IconData icon,
    required String label,
    required int value,
    required Color color,
    required bool isVisible,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: color,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              isVisible ? "Rp $value" : "Rp ******",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        )
      ],
    );
  }
}