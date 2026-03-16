import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_page.dart';
import '/service/supabase_service.dart';
import '../../notifikasi/notifier.dart';
import '../../notifikasi/auth_error_helper.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final service = SupabaseService();

  bool isLoading = false;

  late AnimationController shakeController;
  late Animation<double> shakeAnimation;

  @override
  void initState() {
    super.initState();
    shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    shakeAnimation = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(
        parent: shakeController,
        curve: Curves.elasticIn,
      ),
    );
  }

  Future<void> login() async {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;
    setState(() => isLoading = true);
    try {
      await service.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      Get.offAll(
        () => HomePage(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      shakeController.forward(from: 0);
      final message = AuthErrorHelper.getMessage(e.toString());
      Notifier.error(
        "Login Gagal",
        message,
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    shakeController.dispose();
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
                color: Color.fromARGB(140, 255, 255, 255),
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
                color: Color.fromARGB(80, 255, 255, 255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.account_balance_wallet,
                        size: 90,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "My Pink Finance",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Kelola keuanganmu dengan mudah",
                        style: TextStyle(color: Color.fromARGB(179, 255, 255, 255)),
                      ),
                      const SizedBox(height: 30),
                      Card(
                        elevation: 8,
                        shadowColor: Theme.of(context).shadowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Email wajib diisi";
                                  }
                                  if (!value.contains("@") || !value.contains(".")) {
                                    return "Format email tidak valid";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              AnimatedBuilder(
                                animation: shakeAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(shakeAnimation.value, 0),
                                    child: child,
                                  );
                                },
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password wajib diisi";
                                    }
                                    if (value.length < 6) {
                                      return "Password minimal 6 karakter";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 255, 107, 156),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: isLoading ? null : login,
                                  child: isLoading
                                    ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                    : const Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Belum punya akun?"),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const RegisterPage());
                                    },
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 107, 156),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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