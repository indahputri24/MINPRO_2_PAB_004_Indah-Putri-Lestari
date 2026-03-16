import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/transaksi.dart';

class SupabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  User? get currentUser => supabase.auth.currentUser;
  String? get namaUser => currentUser?.userMetadata?['nama'];

  Future<AuthResponse> register(
    String email,
    String password,
    String nama,
  ) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'nama': nama},
    );
    if (response.user == null) {
      throw Exception("Registrasi gagal. Silakan coba lagi.");
    }
    return response;
  }

  Future<AuthResponse> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw Exception("Login gagal. Periksa email atau password.");
    }
    return response;
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  Future<List<ModelTransaksi>> getTransaksi() async {
    final user = currentUser;
    if (user == null) {
      throw Exception("User belum login.");
    }
    final data = await supabase
        .from('transaksi')
        .select()
        .eq('user_id', user.id);
    return data
        .map<ModelTransaksi>((e) => ModelTransaksi.fromJson(e))
        .toList();
  }

  Future<void> tambahTransaksi(ModelTransaksi trx) async {
    final user = currentUser;
    if (user == null) {
      throw Exception("User belum login.");
    }
    await supabase.from('transaksi').insert({
      'user_id': user.id,
      'jumlah': trx.jumlah,
      'keterangan': trx.keterangan,
      'tanggal': trx.tanggal.toIso8601String(),
      'kategori': trx.kategori,
      'tipe': trx.tipe,
      'catatan': trx.catatan,
    });
  }

  Future<void> updateTransaksi(ModelTransaksi trx) async {
    if (trx.id == null) {
      throw Exception("ID transaksi tidak valid.");
    }
    final user = currentUser;
    await supabase
        .from('transaksi')
        .update({
          'user_id': user!.id,
          'jumlah': trx.jumlah,
          'keterangan': trx.keterangan,
          'tanggal': trx.tanggal.toIso8601String(),
          'kategori': trx.kategori,
          'tipe': trx.tipe,
          'catatan': trx.catatan,
        })
        .eq('id', trx.id!)
        .eq('user_id', user.id);
  }

  Future<void> deleteTransaksi(int id) async {
    final user = currentUser;
    if (user == null) {
      throw Exception("User belum login.");
    }
    await supabase
        .from('transaksi')
        .delete()
        .eq('id', id)
        .eq('user_id', user.id)
        .select();
  }
}