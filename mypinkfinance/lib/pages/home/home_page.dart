import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/transaksi.dart';
import '../home/home_controller.dart';
import '../add_page/add_page.dart';
import '../login/login_page.dart';
import '../theme/theme_controller.dart';
import '/service/supabase_service.dart';
import 'widgets/header.dart';
import 'widgets/home_menu.dart';
import 'widgets/home_content.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());
  final SupabaseService service = SupabaseService();

  Future<void> bukaHalTambah([ModelTransaksi? data]) async {
    final result = await Get.to(() => AddPage(existingData: data));
    if (result != null) {
      controller.tambahAtauEdit(result, data);
    }
  }

  Future<void> logout() async {
    await service.logout();
    Get.offAll(() => const LoginPage());
  }

  Future<void> konfirmasiLogout() async {
    final konfirmasi = await Get.dialog<bool>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          "Logout?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Apakah kamu yakin ingin keluar dari akun ini?",
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 107, 156),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Get.back(result: true),
            child: const Text(
              "Logout",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ],
      ),
    );
    if (konfirmasi == true) {
      await logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    final namaUser = service.namaUser ?? "User";
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 107, 156),
        elevation: 0,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.25),
              child: Text(
                namaUser[0].toUpperCase(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            IconButton(
              icon: Obx(() => Icon(
                themeController.isDark.value
                  ? Icons.dark_mode
                  : Icons.light_mode,
              )),
              onPressed: themeController.toggleTheme,
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hai, $namaUser 👋",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "Mari kelola keuanganmu hari ini",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(179, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: konfirmasiLogout,
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 26,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 77, 136),
        onPressed: () => bukaHalTambah(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Header(),
              SizedBox(height: 10),
              HomeMenu(),
              SizedBox(height: 10),
              HomeContent(),
            ],
          ),
        ),
      ),
    );
  }
}