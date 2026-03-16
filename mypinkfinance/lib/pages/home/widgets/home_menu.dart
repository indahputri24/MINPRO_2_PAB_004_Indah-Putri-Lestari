import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_controller.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _menuItem(
              icon: Icons.calendar_month,
              label: "Kalender",
              active: controller.viewMode.value == HomeViewMode.kalender,
              onTap: () => controller.ubahMode(HomeViewMode.kalender),
            ),
            _menuItem(
              icon: Icons.receipt_long,
              label: "Transaksi",
              active: controller.viewMode.value == HomeViewMode.transaksi,
              onTap: () => controller.ubahMode(HomeViewMode.transaksi),
            ),
          ],
        ),
      );
    });
  }

  Widget _menuItem({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: active
                ? const Color.fromARGB(255, 255, 107, 156)
                : const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Icon(
              icon,
              color: active
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 97, 97, 97),
              size: 26,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: active
                ? const Color.fromARGB(255, 255, 107, 156)
                : const Color.fromARGB(221, 0, 0, 0),
            ),
          )
        ],
      ),
    );
  }
}