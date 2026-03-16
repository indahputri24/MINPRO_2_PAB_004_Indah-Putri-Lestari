# MINPRO 2 Pemrograman Aplikasi Bergerak

Nama: Indah Putri Lestari

NIM: 2409116004

Kelas: A

# Deskripsi Apliksi Catatan Keuangan Pribadi (MY PINK FINCARE)

My Pink Finance adalah aplikasi pencatatan keuangan pribadi yang dibuat menggunakan Flutter. Aplikasi ini membantu pengguna dalam mencatat pemasukan dan pengeluaran dengan mudah serta memantau kondisi keuangan secara terorganisir.

Pengguna dapat menambahkan, mengedit, dan menghapus transaksi, memilih kategori transaksi, serta melihat riwayat transaksi berdasarkan tanggal melalui tampilan kalender maupun daftar transaksi. Aplikasi ini juga dilengkapi dengan fitur autentikasi pengguna menggunakan Supabase serta pilihan tampilan light mode dan dark mode untuk meningkatkan kenyamanan penggunaan.

# Fitur Aplikasi Catatan Keuangan Pribadi (MY PINK FINCARE)

## 1. Tambah Data Transaksi ke Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214444.png)

Halaman Tambah Transaksi digunakan untuk mencatat transaksi keuangan baru. Pada halaman ini, pengguna dapat mengisi beberapa informasi seperti jumlah uang, keterangan transaksi, tanggal, jenis transaksi (pemasukan atau pengeluaran), serta kategori transaksi.

Selain itu, pengguna juga dapat menambahkan catatan tambahan (opsional) jika diperlukan. Setelah semua data diisi dengan benar, pengguna dapat menekan tombol Simpan untuk menyimpan transaksi ke dalam sistem sehingga data tersebut akan muncul pada daftar transaksi dan mempengaruhi total saldo.

#### Notifikasi Berhasil Menambahkan Transaksi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214455.png)

Setelah pengguna menekan tombol Simpan pada halaman tambah transaksi, aplikasi akan menampilkan notifikasi konfirmasi bahwa transaksi berhasil ditambahkan. Pesan yang muncul menunjukkan bahwa data transaksi telah berhasil disimpan ke dalam sistem.

Notifikasi ini berfungsi sebagai pemberitahuan kepada pengguna bahwa proses penyimpanan data berhasil dilakukan, dan transaksi tersebut akan langsung mempengaruhi saldo serta daftar transaksi pada halaman utama aplikasi.

#### Validasi Input Kolom Jumlah

Kolom Jumlah memiliki sistem validasi untuk memastikan jumlah atau nominal yang dimasukkan pengguna sesuai dan logis.

1. Tidak Boleh Kosong

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214226.png)

Jika pengguna tidak mengisi kolom jumlah, maka akan muncul pesan: "Jumlah wajib diisi".
   
2. Hanya Menerima Angka

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214320.png)

Jika pengguna memasukkan huruf atau karakter selain angka, maka sistem akan menampilkan pesan: "Jumlah hanya boleh angka".

3. Batas inputan nilai maksimal

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214307.png)

Jika nominal yang dimasukkan terlalu besar dan tidak wajar (misalnya miliaran atau triliunan), maka sistem akan menampilkan pesan: "Jumlah terlalu besar, tidak wajar".

4. Jumlah harus > 0

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214254.png)

Jika pengguna hanya mengisi angka 0, maka akan muncuk pesan: "Jumlah harus > 0", yang artinya jumlah atau nominal harus diisi lebih dari 0.

#### Validasi Input Kolom Keterangan

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214226.png)

Kolom Keterangan memiliki validasi untuk memastikan pengguna tidak mengosongkan deskripsi transaksi karena setiap transaksi memiliki penjelasan yang jelas. Jika kolom ini tidak diisi, sistem akan menampilkan pesan: “Keterangan wajib diisi”.

## 2. Tampilan Data Transaksi dari Supabase

#### AppBar Home Page

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/726bd20c2c3ad47c45fd0775ac5a1dac6b28d7d9/screenshot/Cuplikan%20layar%202026-03-16%20134947.png)

Pada bagian atas aplikasi terdapat AppBar yang berfungsi sebagai area informasi dan navigasi utama bagi pengguna. Di sisi kiri ditampilkan ikon profil dengan huruf awal nama pengguna, yang diambil dari akun yang sedang login.

Di sampingnya terdapat sapaan personal, yaitu “Hai, Indah Putri” disertai teks tambahan “Mari kelola keuanganmu hari ini” yang memberikan kesan ramah kepada pengguna saat membuka aplikasi.

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/726bd20c2c3ad47c45fd0775ac5a1dac6b28d7d9/screenshot/Cuplikan%20layar%202026-03-15%20214145.png)

Pada sisi kanan AppBar terdapat ikon logout, yang digunakan untuk keluar dari akun. Ketika ikon tersebut ditekan, pengguna akan diarahkan untuk keluar dari aplikasi dan kembali ke halaman login.

#### Header

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221037.png)

Terdapat kartu Saldo Saat Ini yang menampilkan total saldo berdasarkan hasil perhitungan antara total pemasukan dan total pengeluaran. Selain itu juga ditampilkan ringkasan jumlah pemasukan (ditandai warna hijau) dan pengeluaran (ditandai warna merah).

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221037.png)

Pengguna juga dapat menekan ikon mata untuk menyembunyikan atau menampilkan jumlah saldo, sehingga membantu menjaga privasi ketika aplikasi digunakan di tempat umum.

#### Tampilan Menu Icon Transaksi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221117.png)

Pada menu Transaksi, aplikasi menampilkan daftar seluruh transaksi yang telah dicatat oleh pengguna. Setiap transaksi ditampilkan dalam bentuk daftar (list) yang berisi informasi seperti nama transaksi, kategori, tanggal, serta jumlah uang. Transaksi juga dibedakan berdasarkan jenisnya, yaitu pemasukan yang ditandai dengan warna hijau dan pengeluaran yang ditandai dengan warna merah.

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221037.png)

Selain itu, halaman ini juga dilengkapi dengan fitur range tanggal yang memungkinkan pengguna untuk memfilter transaksi berdasarkan rentang tanggal tertentu. Dengan fitur ini, pengguna dapat melihat riwayat transaksi dalam periode waktu yang diinginkan sehingga lebih mudah untuk memantau aktivitas keuangan.

#### Tampilan Menu Icon Kalender

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221053.png)

Pada menu Kalender, pengguna dapat melihat transaksi berdasarkan tanggal tertentu melalui tampilan kalender. Pengguna dapat memilih tanggal yang diinginkan untuk melihat transaksi yang terjadi pada hari tersebut. Setiap transaksi ditampilkan dalam bentuk list yang berisi ikon kategori, nama transaksi, kategori, serta jumlah uang.

Di bagian bawah kalender juga ditampilkan ringkasan keuangan harian, seperti total pemasukan, pengeluaran, dan selisih saldo pada tanggal yang dipilih. Fitur ini memudahkan pengguna untuk memantau aktivitas keuangan secara lebih detail berdasarkan hari tertentu.

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221106.png)

Tanggal yang sedang dipilih akan ditandai dengan warna utama (pink) sebagai indikator hari aktif. Jika pengguna memilih tanggal lain, maka tanggal sebelumnya akan berubah menjadi warna lebih pucat/abu-abu, menandakan bahwa tanggal tersebut tidak sedang dipilih.

Jika pada tanggal tersebut tidak terdapat transaksi, maka aplikasi akan menampilkan informasi bahwa tidak ada transaksi pada hari tersebut.

#### Tampilan Detail Transaksi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132746.png)

Ketika pengguna menekan salah satu item transaksi, aplikasi akan menampilkan popup detail transaksi. Tampilan ini berfungsi untuk melihat informasi transaksi secara lebih lengkap.

Informasi yang ditampilkan meliputi kategori transaksi, keterangan, dan tanggal transaksi. Selain itu, jumlah uang juga ditampilkan dengan jelas di bagian bawah, dengan warna berbeda untuk menunjukkan pemasukan atau pengeluaran.

Pada bagian bawah popup terdapat dua aksi yang dapat dilakukan pengguna, yaitu Edit untuk mengubah data transaksi dan Hapus untuk menghapus transaksi tersebut dari daftar. Popup ini juga dapat ditutup melalui tombol X di bagian atas.

Tampilan ini digunakan pengguna untuk memastikan kembali data transaksi yang ada sebelum melakukan tindakan lebih lanjut seperti mengedit atau menghapus transaksi.

## 3. Edit Data Transaksi

#### Sebelum Edit Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130656.png)

Pada contoh sebelum edit data ini, transaksi memiliki kategori Makan, dengan keterangan “Sate Ayam”, dan tanggal transaksi 15 Maret 2026. Jumlah uang yang tercatat pada transaksi tersebut adalah Rp2, yang termasuk dalam tipe pengeluaran.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130537.png)

Baris data yang dicentang menunjukkan transaksi dengan keterangan “Sate Ayam” yang memiliki jumlah Rp2, kategori Makan, dan tipe Pengeluaran dengan tanggal 15 Maret 2026. Data ini merupakan data awal sebelum dilakukan proses edit pada aplikasi.

#### Edit Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130717.png)

Ketika pengguna memilih tombol Edit pada detail transaksi, aplikasi akan menampilkan halaman edit dengan data sebelumnya sudah terisi otomatis.

Pada contoh ini, sebelumnya transaksi memiliki nominal Rp2, kemudian pengguna mengubah nominal tersebut menjadi Rp20.000. Selain itu, pengguna juga menambahkan catatan tambahan yaitu “di rapakk” pada kolom catatan.

Setelah perubahan selesai dilakukan, pengguna dapat menekan tombol Simpan untuk menyimpan pembaruan data. Data transaksi kemudian akan diperbarui di dalam sistem sesuai dengan perubahan yang telah dilakukan.

#### Sesudah Edit Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221428.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/e7496396bdbf54d1f87ed3d1790bd53cd6a88f45/screenshot/Cuplikan%20layar%202026-03-16%20130132.png)

Setelah pengguna berhasil melakukan perubahan pada data transaksi dan menekan tombol Simpan, aplikasi akan menampilkan notifikasi bahwa transaksi berhasil diperbarui.

Notifikasi ini muncul di bagian atas layar dengan pesan “Transaksi Diperbarui” yang menandakan bahwa perubahan data telah berhasil disimpan ke dalam sistem. Setelah itu, daftar transaksi akan otomatis menampilkan data yang sudah diperbarui sesuai dengan perubahan yang dilakukan oleh pengguna.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130743.png)

Setelah pengguna melakukan proses edit transaksi pada aplikasi, perubahan data akan langsung tersimpan dan diperbarui di database Supabase. Pada contoh ini, transaksi “Sate Ayam” yang sebelumnya memiliki jumlah Rp2 telah diubah menjadi Rp20.000 melalui fitur edit pada aplikasi.

Selain perubahan nominal, pengguna juga menambahkan catatan tambahan, sehingga kolom catatan pada tabel database ikut diperbarui sesuai dengan data yang baru dimasukkan. Perubahan ini menunjukkan bahwa fitur update transaksi pada aplikasi telah berhasil terhubung dengan database Supabase.

## 4. Hapus Data Transaksi

#### Sebelum Hapus Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132135.png)

Pada contoh sebelum hapus data ini, transaksi yang ditampilkan memiliki kategori Makan, dengan keterangan “Tahu Bakso”, tanggal 14 Maret 2026, serta catatan tambahan “beli di pasar ramadhan gor segiri”. Nominal transaksi tercatat sebesar Rp15.000 yang termasuk dalam pengeluaran.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132224.png)

Baris data yang dicentang menunjukkan transaksi dengan keterangan “Tahu Bakso” yang memiliki jumlah Rp15.000, kategori Makan, tipe Pengeluaran, serta tanggal 14 Maret 2026. Pada kolom catatan juga terdapat keterangan tambahan yaitu “beli di pasar ramadhan gor segiri”.

Data ini merupakan data transaksi yang masih tersimpan di database sebelum dilakukan proses penghapusan melalui aplikasi.

#### Hapus Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132239.png)

Ketika pengguna menekan tombol Hapus pada detail transaksi, aplikasi akan menampilkan popup konfirmasi penghapusan. Popup ini bertujuan untuk memastikan bahwa pengguna benar-benar ingin menghapus transaksi tersebut.

Pada tampilan ini terdapat dua pilihan, yaitu Batal untuk membatalkan proses penghapusan dan kembali ke halaman sebelumnya, serta Hapus untuk melanjutkan proses penghapusan data transaksi.

Jika pengguna memilih Hapus, maka data transaksi akan dihapus dari aplikasi sekaligus dari database Supabase, sehingga transaksi tersebut tidak lagi muncul pada daftar transaksi.

#### Sesudah Hapus Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132246.png)

Ketika pengguna menekan tombol Hapus pada detail transaksi, aplikasi akan menampilkan popup konfirmasi penghapusan. Popup ini bertujuan untuk memastikan bahwa pengguna benar-benar ingin menghapus transaksi tersebut.

Pada tampilan ini terdapat dua pilihan, yaitu Batal untuk membatalkan proses penghapusan dan kembali ke halaman sebelumnya, serta Hapus untuk melanjutkan proses penghapusan data transaksi.

Jika pengguna memilih Hapus, maka data transaksi akan dihapus dari aplikasi sekaligus dari database Supabase, sehingga transaksi tersebut tidak lagi muncul pada daftar transaksi.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132328.png)

Setelah proses penghapusan dilakukan melalui aplikasi, data transaksi “Tahu Bakso” dengan jumlah Rp15.000 yang sebelumnya ada di database sudah tidak lagi muncul pada tabel.

## 5. Login (Nilai Tambah)

Halaman Login digunakan oleh pengguna untuk masuk ke dalam aplikasi setelah akun berhasil dibuat dan diverifikasi.

#### Validasi Input Kosong

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20214042.png)

Pada halaman ini, pengguna diminta memasukkan email dan password yang telah didaftarkan sebelumnya.

Sistem juga menerapkan validasi input, sehingga jika kolom email atau password kosong, akan muncul pesan kesalahan seperti “Email wajib diisi” atau “Password wajib diisi”. Jika data yang dimasukkan benar, pengguna akan langsung diarahkan ke halaman utama aplikasi.

#### Validasi Salah Input

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-16%20120302.png)

Jika pengguna memasukkan email atau password yang salah, sistem akan menampilkan notifikasi Login Gagal di bagian atas halaman. Pesan ini memberi tahu bahwa email atau password tidak sesuai dengan data yang terdaftar.

#### Validasi Input Terisi Benar

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214058.png)

Jika pengguna telah mengisi Email dan Password dengan benar, lalu pengguna menekan tombol Login, aplikasi akan memproses data email dan password yang dimasukkan. Selama proses ini berlangsung, tombol login akan berubah menjadi indikator loading sebagai tanda bahwa sistem sedang melakukan proses autentikasi.

Hal ini bertujuan untuk memberi tahu pengguna bahwa aplikasi sedang memeriksa data login sebelum mengarahkan pengguna ke halaman utama aplikasi jika proses login berhasil.

## 6. Register (Nilai Tambah)

#### Validasi Input Kosong

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20211121.png)

Pada halaman Create Account, terdapat beberapa validasi untuk memastikan data yang dimasukkan pengguna sudah benar sebelum proses registrasi dilakukan. Validasi yang diterapkan antara lain:

Nama Pengguna: wajib diisi. Jika kosong, akan muncul pesan “Nama wajib diisi”.

Email: wajib diisi dan harus menggunakan format email yang valid (mengandung @).

Password: wajib diisi dan minimal terdiri dari 6 karakter.

Jika salah satu input tidak memenuhi syarat, sistem akan menampilkan pesan kesalahan di bawah kolom input sehingga pengguna dapat langsung memperbaiki data yang dimasukkan.

#### Validasi Input Format Email dan Password

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213821.png)

Email tidak valid: jika format email tidak sesuai (tidak mengandung @ atau format email yang benar), sistem menampilkan pesan “Format email tidak valid”.

Password terlalu pendek: jika password kurang dari 6 karakter, sistem akan menampilkan pesan “Password minimal 6 karakter”.

#### Validasi Input Terisi Benar

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213846.png)

Pengguna telah mengisi seluruh data dengan benar seperti nama pengguna, email, dan password. Ketika tombol Register ditekan, sistem akan memproses pendaftaran akun dan menampilkan indikator loading sebagai tanda bahwa data sedang dikirim ke server.

Proses ini memastikan bahwa akun baru dapat dibuat dan disimpan dengan aman sebelum pengguna melanjutkan ke tahap berikutnya, yaitu verifikasi email.

#### Verifikasi Email

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213852.png)

Setelah proses registrasi berhasil, pengguna akan diarahkan ke halaman Check Your Email. Pada halaman ini, sistem memberi informasi bahwa link verifikasi telah dikirim ke email yang didaftarkan.

Pengguna perlu membuka email tersebut dan mengklik link verifikasi agar akun dapat diaktifkan sebelum melakukan login. Pada halaman ini juga tersedia beberapa opsi seperti membuka email langsung, mengirim ulang email verifikasi, serta tombol untuk kembali ke halaman login.

#### Membuka Email Verifikasi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213944.png)

Ketika pengguna menekan tombol Buka Email pada halaman verifikasi, aplikasi akan langsung mengarahkan pengguna ke layanan email yang digunakan, seperti Gmail.

Pada halaman email tersebut, pengguna akan menerima pesan dari Supabase Auth yang berisi link konfirmasi pendaftaran akun. Pengguna hanya perlu menekan tombol atau link “Confirm your mail” untuk memverifikasi akun yang telah didaftarkan.

#### Konfirmasi Email Berhasil

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213956.png)

Setelah pengguna menekan link “Confirm your mail” pada email verifikasi, sistem akan secara otomatis mengarahkan pengguna kembali ke aplikasi. Jika proses verifikasi berhasil, pengguna langsung masuk ke halaman utama (Home Page) aplikasi.

#### Kirim Ulang Email Verifikasi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20214019.png)

Pada halaman verifikasi email juga tersedia fitur Kirim Ulang Email. Fitur ini digunakan ketika pengguna belum menerima email verifikasi atau email sebelumnya tidak ditemukan di inbox.

Ketika tombol Kirim Ulang Email ditekan, sistem akan mengirim kembali link verifikasi ke email pengguna. Setelah berhasil dikirim, aplikasi akan menampilkan notifikasi bahwa email telah dikirim kembali.

Untuk mencegah penyalahgunaan, tombol kirim ulang juga dilengkapi dengan waktu tunggu (countdown 3 menit) sebelum pengguna dapat mengirim ulang email verifikasi berikutnya.

## 7. Light Mode dan Dark Mode (Nilai Tambah)

## 8. File .env (Nilai Tambah)

# Widget yang Digunakan Apliksi Catatan Keuangan Pribadi (MY PINK FINCARE)

