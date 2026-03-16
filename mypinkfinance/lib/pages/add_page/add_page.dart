import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/transaksi.dart';
import '/service/supabase_service.dart';
import '../../notifikasi/notifier.dart';

class AddPage extends StatefulWidget {
  final ModelTransaksi? existingData;
  const AddPage({super.key, this.existingData});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final service = SupabaseService();

  late final TextEditingController jumlahController;
  late final TextEditingController keteranganController;
  late final TextEditingController tanggalController;
  late final TextEditingController catatanController;

  DateTime pilihTanggal = DateTime.now();
  String pilihTipe = "Pengeluaran";
  String pilihKategori = "Makan";

  final Map<String, IconData> kategoriPengeluaran = {
    "Makan": Icons.fastfood,
    "Transport": Icons.directions_car,
    "Belanja": Icons.shopping_bag,
    "Hiburan": Icons.sports_esports,
  };

  final Map<String, IconData> kategoriPemasukan = {
    "Gaji": Icons.work,
    "Bonus": Icons.card_giftcard,
    "Freelance": Icons.laptop,
    "Hadiah": Icons.redeem,
  };

  Map<String, IconData> get kategoriSaatIni =>
      pilihTipe == "Pengeluaran"
          ? kategoriPengeluaran
          : kategoriPemasukan;

  @override
  void initState() {
    super.initState();
    jumlahController = TextEditingController();
    keteranganController = TextEditingController();
    tanggalController = TextEditingController();
    catatanController = TextEditingController();

    if (widget.existingData != null) {
      final data = widget.existingData!;
      jumlahController.text = data.jumlah.toString();
      keteranganController.text = data.keterangan;
      pilihTanggal = data.tanggal;
      pilihTipe = data.tipe;
      pilihKategori = data.kategori;
      catatanController.text = data.catatan ?? "";
    }
    _updateTanggalText();
  }

  @override
  void dispose() {
    jumlahController.dispose();
    keteranganController.dispose();
    tanggalController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  void _updateTanggalText() {
    tanggalController.text =
        "${pilihTanggal.day}/${pilihTanggal.month}/${pilihTanggal.year}";
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: pilihTanggal,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        pilihTanggal = picked;
        _updateTanggalText();
      });
    }
  }

  Future<void> simpanData() async {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;
    final jumlah = int.tryParse(jumlahController.text.trim());
    if (jumlah == null) {
      Notifier.error("Input salah", "Jumlah tidak valid");
      return;
    }
    final transaksi = ModelTransaksi(
      id: widget.existingData?.id,
      jumlah: jumlah,
      keterangan: keteranganController.text.trim(),
      tanggal: pilihTanggal,
      kategori: pilihKategori,
      tipe: pilihTipe,
      catatan: catatanController.text.trim().isEmpty
          ? null
          : catatanController.text.trim(),
    );
    try {
      Get.back(result: transaksi);
    } catch (e) {
      Notifier.error("Gagal Menyimpan", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 107, 156),
        title: Text(
          widget.existingData == null
            ? "Tambah Transaksi"
            : "Edit Transaksi",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 228, 239),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.receipt_long,
                    size: 36,
                    color: Color.fromARGB(255, 255, 107, 156),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withValues(alpha: 0.08), 
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      )
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text( 
                              "Jumlah", 
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Theme.of(context).dividerColor)
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "Rp ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: jumlahController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: "0",
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return "Jumlah wajib diisi";
                                        }
                                        final angka = int.tryParse(value);
                                        if (angka == null) {
                                          return "Jumlah harus angka";
                                        }
                                        if (angka <= 0) {
                                          return "Jumlah harus > 0";
                                        }
                                        if (angka > 100000000) {
                                          return "Jumlah terlalu besar, tidak wajar";
                                        }
                                        return null;
                                      },
                                    ), 
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: keteranganController,
                          decoration: const InputDecoration(
                            labelText: "Keterangan",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Keterangan wajib diisi";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: tanggalController,
                          readOnly: true,
                          onTap: pickDate,
                          decoration: const InputDecoration(
                            labelText: "Tanggal",
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pilihTipe = "Pemasukan";
                                    pilihKategori = kategoriSaatIni.keys.first;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: pilihTipe == "Pemasukan"
                                      ? const Color.fromARGB(255, 232, 245, 233)
                                      : Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: pilihTipe == "Pemasukan"
                                        ? const Color.fromARGB(255, 76, 175, 79)
                                        : const Color.fromARGB(255, 224, 224, 224),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.arrow_downward,
                                        color: pilihTipe == "Pemasukan"
                                          ? const Color.fromARGB(255, 76, 175, 79)
                                          : const Color.fromARGB(255, 158, 158, 158),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Pemasukan",
                                        style: TextStyle(
                                          color: pilihTipe == "Pemasukan"
                                            ? const Color.fromARGB(255, 76, 175, 79)
                                            : Theme.of(context).textTheme.bodyMedium?.color,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pilihTipe = "Pengeluaran";
                                    pilihKategori = kategoriSaatIni.keys.first;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: pilihTipe == "Pengeluaran"
                                      ? const Color.fromARGB(255, 255, 235, 238)
                                      : Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: pilihTipe == "Pengeluaran"
                                        ? const Color.fromARGB(255, 244, 67, 54)
                                        : const Color.fromARGB(255, 224, 224, 224),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.arrow_upward,
                                        color: pilihTipe == "Pengeluaran"
                                          ? const Color.fromARGB(255, 244, 67, 54)
                                          : const Color.fromARGB(255, 158, 158, 158),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Pengeluaran",
                                        style: TextStyle(
                                          color: pilihTipe == "Pengeluaran"
                                            ? const Color.fromARGB(255, 244, 67, 54)
                                            : Theme.of(context).textTheme.bodyMedium?.color,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Kategori",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: kategoriSaatIni.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  final kategori = kategoriSaatIni.keys.elementAt(index);
                                  final icon = kategoriSaatIni[kategori];
                                  final selected = pilihKategori == kategori;
                                  final color = pilihTipe == "Pemasukan"
                                    ? const Color.fromARGB(255, 76, 175, 79)
                                    : const Color.fromARGB(255, 244, 67, 54);
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pilihKategori = kategori;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selected
                                          ? color.withAlpha(25)
                                          : Theme.of(context).colorScheme.surface,
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: selected
                                            ? color
                                            : const Color.fromARGB(0, 0, 0, 0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            icon,
                                            color: selected
                                              ? color
                                              : const Color.fromARGB(255, 158, 158, 158),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            kategori,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: catatanController,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: "Catatan Tambahan (Opsional)",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 107, 156),
                            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: simpanData,
                          child: const Text(
                            "SIMPAN",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
    );
  }
}
