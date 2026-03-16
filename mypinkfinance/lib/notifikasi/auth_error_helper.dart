class AuthErrorHelper {

  static String getMessage(String error) {
    if (error.contains("over_email_send_rate_limit") ||
        error.contains("Over send limit") ||
        error.contains("rate limit")) {
      return "Terlalu banyak percobaan registrasi. Silakan tunggu beberapa menit sebelum mencoba lagi.";
    }

    if (error.contains("email_not_confirmed")) {
      return "Email belum diverifikasi. Silakan cek inbox email Anda.";
    }

    if (error.contains("Invalid login credentials")) {
      return "Email atau password salah.";
    }

    if (error.contains("User already registered")) {
      return "Email sudah terdaftar. Silakan login.";
    }

    if (error.contains("Password should be at least")) {
      return "Password terlalu pendek. Minimal 6 karakter.";
    }

    if (error.contains("Network")) {
      return "Koneksi internet bermasalah.";
    }

    return "Terjadi kesalahan. Silakan coba lagi.";
  }
}