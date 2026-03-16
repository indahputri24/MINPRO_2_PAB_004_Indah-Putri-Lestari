import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../notifikasi/notifier.dart';
import '/pages/login/login_page.dart';

class VerifEmailPage extends StatefulWidget {
  final String email;
  const VerifEmailPage({super.key, required this.email});

  @override
  State<VerifEmailPage> createState() => _VerifEmailPageState();
}

class _VerifEmailPageState extends State<VerifEmailPage> {
  final supabase = Supabase.instance.client;
  int cooldown = 0;
  Timer? timer;

  Future<void> openEmail() async {
    final gmailApp = Uri.parse("googlegmail://");
    final gmailWeb = Uri.parse("https://mail.google.com/");
    final emailApp = Uri(scheme: "mailto");
    if (await canLaunchUrl(gmailApp)) {
      await launchUrl(gmailApp);
    } else if (await canLaunchUrl(gmailWeb)) {
      await launchUrl(gmailWeb, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(emailApp)) {
      await launchUrl(emailApp);
    } else {
      Notifier.error(
        "Tidak dapat membuka email",
        "Silakan buka aplikasi email secara manual.",
      );
    }
  }

  Future<void> kirimUlangEmail() async {
    if (cooldown > 0) return;
    try {
      await supabase.auth.resend(
        type: OtpType.signup,
        email: widget.email,
      );
      Notifier.info(
        "Email Dikirim 📩",
        "Link verifikasi telah dikirim kembali.",
      );
      startCooldown();
    } catch (_) {
      Notifier.error(
        "Gagal Mengirim Email",
        "Silakan coba lagi beberapa saat.",
      );
    }
  }

  void startCooldown() {
    setState(() {
      cooldown = 180;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (cooldown == 0) {
        t.cancel();
      } else {
        setState(() {
          cooldown--;
        });
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remain = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remain.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            ),
          ),
          Positioned(
            top: -80,
            right: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(120, 255, 255, 255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: Color.fromARGB(70, 255, 255, 255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
                elevation: 10,
                color: Theme.of(context).cardColor,
                shadowColor: Theme.of(context).shadowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.mark_email_read,
                        size: 90,
                        color: Color.fromARGB(255, 255, 107, 156),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Check Your Email",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Kami telah mengirimkan link verifikasi ke:",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.email,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 107, 156),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Silakan buka email dan klik link verifikasi sebelum login.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6)),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 134, 186),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: openEmail,
                          child: const Text(
                            "Buka Email",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 255, 107, 156)
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: cooldown == 0 ? kirimUlangEmail : null,
                          child: Text(
                            cooldown == 0
                              ? "Kirim Ulang Email"
                              : "Kirim ulang dalam ${formatTime(cooldown)}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 107, 156),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => const LoginPage());
                        },
                        child: const Text("← Kembali ke Login"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}