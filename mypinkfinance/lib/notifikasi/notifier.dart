import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifier {
  static Future success(String title, String message) {
    return Get.dialog(
      Dialog(
        backgroundColor: Theme.of(Get.context!).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 76, 175, 79),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(Get.context!).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 107, 156),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: const Color.fromARGB(255, 229, 56, 53),
      colorText: const Color.fromARGB(255, 255, 255, 255),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(15),
      borderRadius: 12,
    );
  }

  static void info(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Theme.of(Get.context!).cardColor,
      colorText: Theme.of(Get.context!).textTheme.bodyMedium?.color,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(15),
      boxShadows: [
        BoxShadow(
          color: Theme.of(Get.context!).shadowColor.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0,4),
        )
      ],
      borderRadius: 12,
      icon: const Icon(
        Icons.info_outline,
        color: Color.fromARGB(255, 255, 107, 156),
      ),
    );
  }
}