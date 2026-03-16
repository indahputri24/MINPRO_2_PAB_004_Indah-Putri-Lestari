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

### a. Notifikasi Berhasil Menambahkan Transaksi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214455.png)

Setelah pengguna menekan tombol Simpan pada halaman tambah transaksi, aplikasi akan menampilkan notifikasi konfirmasi bahwa transaksi berhasil ditambahkan. Pesan yang muncul menunjukkan bahwa data transaksi telah berhasil disimpan ke dalam sistem.

Notifikasi ini berfungsi sebagai pemberitahuan kepada pengguna bahwa proses penyimpanan data berhasil dilakukan, dan transaksi tersebut akan langsung mempengaruhi saldo serta daftar transaksi pada halaman utama aplikasi.

### b. Validasi Input Kolom Jumlah

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

Jika pengguna hanya mengisi angka 0, maka akan muncul pesan: "Jumlah harus > 0", yang artinya jumlah atau nominal harus diisi lebih dari 0.

### c. Validasi Input Kolom Keterangan

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214226.png)

Kolom Keterangan memiliki validasi untuk memastikan pengguna tidak mengosongkan deskripsi transaksi karena setiap transaksi memiliki penjelasan yang jelas. Jika kolom ini tidak diisi, sistem akan menampilkan pesan: “Keterangan wajib diisi”.

## 2. Tampilan Data Transaksi dari Supabase

### a. AppBar Home Page

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/726bd20c2c3ad47c45fd0775ac5a1dac6b28d7d9/screenshot/Cuplikan%20layar%202026-03-16%20134947.png)

Pada bagian atas aplikasi terdapat AppBar yang berfungsi sebagai area informasi dan navigasi utama bagi pengguna. Di sisi kiri ditampilkan ikon profil dengan huruf awal nama pengguna, yang diambil dari akun yang sedang login.

Di sampingnya terdapat sapaan personal, yaitu “Hai, Indah Putri” disertai teks tambahan “Mari kelola keuanganmu hari ini” yang memberikan kesan ramah kepada pengguna saat membuka aplikasi.

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/726bd20c2c3ad47c45fd0775ac5a1dac6b28d7d9/screenshot/Cuplikan%20layar%202026-03-15%20214145.png)

Pada sisi kanan AppBar terdapat ikon logout, yang digunakan untuk keluar dari akun. Ketika ikon tersebut ditekan, pengguna akan diarahkan untuk keluar dari aplikasi dan kembali ke halaman login.

### b. Header

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221037.png)

Terdapat kartu Saldo Saat Ini yang menampilkan total saldo berdasarkan hasil perhitungan antara total pemasukan dan total pengeluaran. Selain itu juga ditampilkan ringkasan jumlah pemasukan (ditandai warna hijau) dan pengeluaran (ditandai warna merah).

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4c4b4aab72b5b4f92bd15bd69069529594097cf1/screenshot/Cuplikan%20layar%202026-03-15%20221919.png)

Pengguna juga dapat menekan ikon mata untuk menyembunyikan atau menampilkan jumlah saldo, sehingga membantu menjaga privasi ketika aplikasi digunakan di tempat umum.

### c. Tampilan Menu Icon Transaksi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221117.png)

Pada menu Transaksi, aplikasi menampilkan daftar seluruh transaksi yang telah dicatat oleh pengguna. Setiap transaksi ditampilkan dalam bentuk daftar (list) yang berisi informasi seperti nama transaksi, kategori, tanggal, serta jumlah uang. Transaksi juga dibedakan berdasarkan jenisnya, yaitu pemasukan yang ditandai dengan warna hijau dan pengeluaran yang ditandai dengan warna merah.

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221037.png)

Selain itu, halaman ini juga dilengkapi dengan fitur range tanggal yang memungkinkan pengguna untuk memfilter transaksi berdasarkan rentang tanggal tertentu. Dengan fitur ini, pengguna dapat melihat riwayat transaksi dalam periode waktu yang diinginkan sehingga lebih mudah untuk memantau aktivitas keuangan.

### d. Tampilan Menu Icon Kalender

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221053.png)

Pada menu Kalender, pengguna dapat melihat transaksi berdasarkan tanggal tertentu melalui tampilan kalender. Pengguna dapat memilih tanggal yang diinginkan untuk melihat transaksi yang terjadi pada hari tersebut. Setiap transaksi ditampilkan dalam bentuk list yang berisi ikon kategori, nama transaksi, kategori, serta jumlah uang.

Di bagian bawah kalender juga ditampilkan ringkasan keuangan harian, seperti total pemasukan, pengeluaran, dan selisih saldo pada tanggal yang dipilih. Fitur ini memudahkan pengguna untuk memantau aktivitas keuangan secara lebih detail berdasarkan hari tertentu.

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221106.png)

Tanggal yang sedang dipilih akan ditandai dengan warna utama (pink) sebagai indikator hari aktif. Jika pengguna memilih tanggal lain, maka tanggal sebelumnya akan berubah menjadi warna lebih pucat/abu-abu, menandakan bahwa tanggal tersebut tidak sedang dipilih.

Jika pada tanggal tersebut tidak terdapat transaksi, maka aplikasi akan menampilkan informasi bahwa tidak ada transaksi pada hari tersebut.

### e. Tampilan Detail Transaksi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132746.png)

Ketika pengguna menekan salah satu item transaksi, aplikasi akan menampilkan popup detail transaksi. Tampilan ini berfungsi untuk melihat informasi transaksi secara lebih lengkap.

Informasi yang ditampilkan meliputi kategori transaksi, keterangan, dan tanggal transaksi. Selain itu, jumlah uang juga ditampilkan dengan jelas di bagian bawah, dengan warna berbeda untuk menunjukkan pemasukan atau pengeluaran.

Pada bagian bawah popup terdapat dua aksi yang dapat dilakukan pengguna, yaitu Edit untuk mengubah data transaksi dan Hapus untuk menghapus transaksi tersebut dari daftar. Popup ini juga dapat ditutup melalui tombol X di bagian atas.

Tampilan ini digunakan pengguna untuk memastikan kembali data transaksi yang ada sebelum melakukan tindakan lebih lanjut seperti mengedit atau menghapus transaksi.

## 3. Edit Data Transaksi

### a. Sebelum Edit Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130656.png)

Pada contoh sebelum edit data ini, transaksi memiliki kategori Makan, dengan keterangan “Sate Ayam”, dan tanggal transaksi 15 Maret 2026. Jumlah uang yang tercatat pada transaksi tersebut adalah Rp2, yang termasuk dalam tipe pengeluaran.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130537.png)

Baris data yang dicentang menunjukkan transaksi dengan keterangan “Sate Ayam” yang memiliki jumlah Rp2, kategori Makan, dan tipe Pengeluaran dengan tanggal 15 Maret 2026. Data ini merupakan data awal sebelum dilakukan proses edit pada aplikasi.

### b. Edit Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130717.png)

Ketika pengguna memilih tombol Edit pada detail transaksi, aplikasi akan menampilkan halaman edit dengan data sebelumnya sudah terisi otomatis.

Pada contoh ini, sebelumnya transaksi memiliki nominal Rp2, kemudian pengguna mengubah nominal tersebut menjadi Rp20.000. Selain itu, pengguna juga menambahkan catatan tambahan yaitu “di rapakk” pada kolom catatan.

Setelah perubahan selesai dilakukan, pengguna dapat menekan tombol Simpan untuk menyimpan pembaruan data. Data transaksi kemudian akan diperbarui di dalam sistem sesuai dengan perubahan yang telah dilakukan.

### c. Sesudah Edit Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4bf692db74cf549b03e6af12d5a1098d6271ee73/screenshot/Cuplikan%20layar%202026-03-15%20221428.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/e7496396bdbf54d1f87ed3d1790bd53cd6a88f45/screenshot/Cuplikan%20layar%202026-03-16%20130132.png)

Setelah pengguna berhasil melakukan perubahan pada data transaksi dan menekan tombol Simpan, aplikasi akan menampilkan notifikasi bahwa transaksi berhasil diperbarui.

Notifikasi ini muncul di bagian atas layar dengan pesan “Transaksi Diperbarui” yang menandakan bahwa perubahan data telah berhasil disimpan ke dalam sistem. Setelah itu, daftar transaksi akan otomatis menampilkan data yang sudah diperbarui sesuai dengan perubahan yang dilakukan oleh pengguna.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/44c09ad1cd3afdac13f69b6add7ebb8300fb6261/screenshot/Cuplikan%20layar%202026-03-16%20130743.png)

Setelah pengguna melakukan proses edit transaksi pada aplikasi, perubahan data akan langsung tersimpan dan diperbarui di database Supabase. Pada contoh ini, transaksi “Sate Ayam” yang sebelumnya memiliki jumlah Rp2 telah diubah menjadi Rp20.000 melalui fitur edit pada aplikasi.

Selain perubahan nominal, pengguna juga menambahkan catatan tambahan, sehingga kolom catatan pada tabel database ikut diperbarui sesuai dengan data yang baru dimasukkan. Perubahan ini menunjukkan bahwa fitur update transaksi pada aplikasi telah berhasil terhubung dengan database Supabase.

## 4. Hapus Data Transaksi

### a. Sebelum Hapus Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132135.png)

Pada contoh sebelum hapus data ini, transaksi yang ditampilkan memiliki kategori Makan, dengan keterangan “Tahu Bakso”, tanggal 14 Maret 2026, serta catatan tambahan “beli di pasar ramadhan gor segiri”. Nominal transaksi tercatat sebesar Rp15.000 yang termasuk dalam pengeluaran.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132224.png)

Baris data yang dicentang menunjukkan transaksi dengan keterangan “Tahu Bakso” yang memiliki jumlah Rp15.000, kategori Makan, tipe Pengeluaran, serta tanggal 14 Maret 2026. Pada kolom catatan juga terdapat keterangan tambahan yaitu “beli di pasar ramadhan gor segiri”.

Data ini merupakan data transaksi yang masih tersimpan di database sebelum dilakukan proses penghapusan melalui aplikasi.

### b. Hapus Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132239.png)

Ketika pengguna menekan tombol Hapus pada detail transaksi, aplikasi akan menampilkan popup konfirmasi penghapusan. Popup ini bertujuan untuk memastikan bahwa pengguna benar-benar ingin menghapus transaksi tersebut.

Pada tampilan ini terdapat dua pilihan, yaitu Batal untuk membatalkan proses penghapusan dan kembali ke halaman sebelumnya, serta Hapus untuk melanjutkan proses penghapusan data transaksi.

### c. Sesudah Hapus Data

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132246.png)

Setelah pengguna menekan tombol Hapus dan mengonfirmasi penghapusan transaksi, aplikasi akan menampilkan notifikasi bahwa transaksi berhasil dihapus.

Pada tampilan ini muncul pesan “Transaksi Dihapus” yang menandakan bahwa data transaksi telah berhasil dihapus dari sistem. Notifikasi ini juga disertai ikon centang sebagai indikator bahwa proses penghapusan berhasil dilakukan.

Setelah proses ini selesai, data transaksi tersebut tidak lagi muncul pada daftar transaksi di aplikasi karena sudah terhapus dari database Supabase.

- Data di Supabase

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a1618b9330c4bcbe35c7f59f48553366ab94daf7/screenshot/Cuplikan%20layar%202026-03-16%20132328.png)

Setelah proses penghapusan dilakukan melalui aplikasi, data transaksi “Tahu Bakso” dengan jumlah Rp15.000 yang sebelumnya ada di database sudah tidak lagi muncul pada tabel.

## 5. Login (Nilai Tambah)

Supabase Auth digunakan untuk mengelola proses autentikasi pengguna pada aplikasi. Pada fitur login, pengguna memasukkan email dan password melalui halaman login, kemudian aplikasi mengirimkan data tersebut ke Supabase untuk diverifikasi. Jika email dan password sesuai dengan akun yang terdaftar, Supabase akan mengizinkan pengguna masuk ke aplikasi dan membuat sesi login. Setelah berhasil login, pengguna dapat mengakses fitur aplikasi seperti melihat, menambah, atau mengedit data transaksi.

### a. Validasi Input Kosong

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20214042.png)

Pada halaman ini, pengguna diminta memasukkan email dan password yang telah didaftarkan sebelumnya.

Sistem juga menerapkan validasi input, sehingga jika kolom email atau password kosong, akan muncul pesan kesalahan seperti “Email wajib diisi” atau “Password wajib diisi”. Jika data yang dimasukkan benar, pengguna akan langsung diarahkan ke halaman utama aplikasi.

### b. Validasi Salah Input

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-16%20120302.png)

Jika pengguna memasukkan email atau password yang salah, sistem akan menampilkan notifikasi Login Gagal di bagian atas halaman. Pesan ini memberi tahu bahwa email atau password tidak sesuai dengan data yang terdaftar.

### c. Validasi Input Terisi Benar

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a18c0a7ba9fb4c2ba6cccc78ac3ddecd6302da6c/screenshot/Cuplikan%20layar%202026-03-15%20214058.png)

Jika pengguna telah mengisi Email dan Password dengan benar, lalu pengguna menekan tombol Login, aplikasi akan memproses data email dan password yang dimasukkan. Selama proses ini berlangsung, tombol login akan berubah menjadi indikator loading sebagai tanda bahwa sistem sedang melakukan proses autentikasi. Hal ini bertujuan untuk memberi tahu pengguna bahwa aplikasi sedang memeriksa data login sebelum mengarahkan pengguna ke halaman utama aplikasi jika proses login berhasil.

## 6. Register (Nilai Tambah)

Supabase Auth digunakan untuk proses pembuatan akun baru pada aplikasi. Pada fitur register, pengguna memasukkan data seperti nama, email, dan password melalui halaman pendaftaran. Data tersebut kemudian dikirim ke Supabase untuk dibuatkan akun baru. Jika proses berhasil, Supabase akan menyimpan akun pengguna dan mengirimkan email verifikasi agar pengguna dapat mengaktifkan akunnya sebelum melakukan login ke aplikasi.

### a. Validasi Input Kosong

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20211121.png)

Pada halaman Create Account, terdapat beberapa validasi untuk memastikan data yang dimasukkan pengguna sudah benar sebelum proses registrasi dilakukan. Validasi yang diterapkan antara lain:

Nama Pengguna: wajib diisi. Jika kosong, akan muncul pesan “Nama wajib diisi”.

Email: wajib diisi dan harus menggunakan format email yang valid (mengandung @).

Password: wajib diisi dan minimal terdiri dari 6 karakter.

Jika salah satu input tidak memenuhi syarat, sistem akan menampilkan pesan kesalahan di bawah kolom input sehingga pengguna dapat langsung memperbaiki data yang dimasukkan.

### b. Validasi Input Format Email dan Password

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213821.png)

Email tidak valid: jika format email tidak sesuai (tidak mengandung @ atau format email yang benar), sistem menampilkan pesan “Format email tidak valid”.

Password terlalu pendek: jika password kurang dari 6 karakter, sistem akan menampilkan pesan “Password minimal 6 karakter”.

### c. Validasi Input Terisi Benar

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213846.png)

Pengguna telah mengisi seluruh data dengan benar seperti nama pengguna, email, dan password. Ketika tombol Register ditekan, sistem akan memproses pendaftaran akun dan menampilkan indikator loading sebagai tanda bahwa data sedang dikirim ke server.

Proses ini memastikan bahwa akun baru dapat dibuat dan disimpan dengan aman sebelum pengguna melanjutkan ke tahap berikutnya, yaitu verifikasi email.

### d. Verifikasi Email

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213852.png)

Setelah proses registrasi berhasil, pengguna akan diarahkan ke halaman Check Your Email. Pada halaman ini, sistem memberi informasi bahwa link verifikasi telah dikirim ke email yang didaftarkan.

Pengguna perlu membuka email tersebut dan mengklik link verifikasi agar akun dapat diaktifkan sebelum melakukan login. Pada halaman ini juga tersedia beberapa opsi seperti membuka email langsung, mengirim ulang email verifikasi, serta tombol untuk kembali ke halaman login.

### e. Membuka Email Verifikasi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213944.png)

Ketika pengguna menekan tombol Buka Email pada halaman verifikasi, aplikasi akan langsung mengarahkan pengguna ke layanan email yang digunakan, seperti Gmail.

Pada halaman email tersebut, pengguna akan menerima pesan dari Supabase Auth yang berisi link konfirmasi pendaftaran akun. Pengguna hanya perlu menekan tombol atau link “Confirm your mail” untuk memverifikasi akun yang telah didaftarkan.

### f. Konfirmasi Email Berhasil

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20213956.png)

Setelah pengguna menekan link “Confirm your mail” pada email verifikasi, sistem akan secara otomatis mengarahkan pengguna kembali ke aplikasi. Jika proses verifikasi berhasil, pengguna langsung masuk ke halaman utama (Home Page) aplikasi.

### g. Kirim Ulang Email Verifikasi

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/a05fa7a57cafc5e6b1f350f69c2c13c2eee7f7d1/screenshot/Cuplikan%20layar%202026-03-15%20214019.png)

Pada halaman verifikasi email juga tersedia fitur Kirim Ulang Email. Fitur ini digunakan ketika pengguna belum menerima email verifikasi atau email sebelumnya tidak ditemukan di inbox.

Ketika tombol Kirim Ulang Email ditekan, sistem akan mengirim kembali link verifikasi ke email pengguna. Setelah berhasil dikirim, aplikasi akan menampilkan notifikasi bahwa email telah dikirim kembali.

Untuk mencegah penyalahgunaan, tombol kirim ulang juga dilengkapi dengan waktu tunggu (countdown 3 menit) sebelum pengguna dapat mengirim ulang email verifikasi berikutnya.

### h. Notifikasi Registrasi Gagal

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222148.png)

Pada tampilan ini terlihat notifikasi “Registrasi Gagal” yang muncul ketika pengguna mencoba melakukan pendaftaran akun terlalu sering dalam waktu yang berdekatan.

Pesan “Terlalu banyak percobaan registrasi. Silakan tunggu beberapa menit sebelum mencoba lagi.” menunjukkan bahwa sistem keamanan dari layanan autentikasi membatasi jumlah percobaan pendaftaran dalam periode waktu tertentu. Hal ini bertujuan untuk mencegah penyalahgunaan sistem atau spam registrasi.

Pengguna perlu menunggu beberapa menit terlebih dahulu, kemudian dapat mencoba kembali proses registrasi setelah batas waktu tersebut selesai.

## 7. Light Mode dan Dark Mode (Nilai Tambah)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20221947.png)

Aplikasi ini juga menyediakan fitur Light Mode dan Dark Mode yang memungkinkan pengguna mengganti tampilan tema sesuai preferensi. Pengguna dapat mengubah tema dengan menekan ikon mode di bagian AppBar.

Jika Light Mode aktif, tampilan aplikasi akan menggunakan warna terang seperti putih dan pink, sehingga terlihat lebih cerah dan nyaman digunakan pada kondisi cahaya yang cukup.

Sedangkan jika Dark Mode diaktifkan, tampilan aplikasi akan berubah menjadi warna lebih gelap, sehingga lebih nyaman digunakan pada kondisi cahaya rendah serta dapat membantu mengurangi kelelahan mata.

Perubahan tema ini akan langsung diterapkan ke seluruh tampilan aplikasi, dan pengaturan tema juga tetap tersimpan sehingga ketika aplikasi dibuka kembali, tema yang terakhir dipilih akan tetap digunakan.

### Tampilan Lainnya

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20221952.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222005.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222014.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222023.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222029.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222035.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222046.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222104.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222120.png)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/4b999e7967cdcaac1f99bd2fe10c0b348156a4e2/screenshot/Cuplikan%20layar%202026-03-15%20222124.png)

## 8. Konfigurasi File `.env` (Nilai Tambah)

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/ca54c3e87a383d63af71c0df3308beeb02fa3c3d/screenshot/Cuplikan%20layar%202026-03-16%20154126.png)

Aplikasi ini menggunakan file `.env` untuk menyimpan konfigurasi penting yang digunakan saat aplikasi berjalan. File ini berfungsi untuk menyimpan informasi sensitif, seperti URL proyek Supabase dan API Key, agar tidak langsung ditulis di dalam kode program. Dengan menggunakan `.env`, data penting seperti Supabase URL dan Anon Public Key dapat dipisahkan dari kode utama aplikasi.

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/912c8c68aa316061b593d68a33feaed7d882af6c/screenshot/Cuplikan%20layar%202026-03-16%20154428.png)

Pada file .env, terdapat beberapa variabel konfigurasi seperti:

`SUPABASE_URL`: berisi alamat URL dari proyek Supabase yang digunakan aplikasi MY PINK FINCARE.

`SUPABASE_ANON_KEY`: berisi API key publik yang digunakan untuk menghubungkan aplikasi dengan database Supabase.

Pada file `main.dart`, konfigurasi tersebut akan dipanggil menggunakan package `flutter_dotenv` sebelum aplikasi dijalankan. Kode yang digunakan adalah sebagai berikut:

![image alt](https://github.com/indahputri24/MINPRO_2_PAB_004_Indah-Putri-Lestari/blob/797a565f996183afb4e17c5e1af247f701d9fd6e/screenshot/Cuplikan%20layar%202026-03-16%20155529.png)

Kode tersebut berfungsi untuk membaca variabel dari file `.env`, kemudian menggunakan nilai tersebut untuk menginisialisasi koneksi aplikasi dengan Supabase. Dengan cara ini, aplikasi dapat terhubung dengan backend dan database Supabase tanpa harus menuliskan informasi sensitif secara langsung di dalam kode program.

# Widget yang Digunakan Apliksi Catatan Keuangan Pribadi (MY PINK FINCARE)

### A. Widget Struktur Utama
1. GetMaterialApp: Digunakan sebagai widget utama (root) aplikasi yang mengaktifkan fitur dari library GetX seperti navigasi antar halaman, pengaturan tema aplikasi, serta pengelolaan state secara global.
2. Scaffold: Digunakan sebagai kerangka dasar tampilan setiap halaman aplikasi, yang menampung komponen utama seperti AppBar, body, serta FloatingActionButton.
3. AppBar: Digunakan sebagai bagian header di halaman utama aplikasi untuk menampilkan informasi pengguna, tombol logout, serta tombol untuk mengganti mode tema (dark mode atau light mode).
4. SafeArea: Digunakan untuk memastikan tampilan aplikasi tidak tertutup oleh area sistem perangkat seperti notch, status bar, atau bagian layar lainnya.
   
### B. Widget Layout (Pengatur Tata Letak)
5. Column: Digunakan untuk menyusun beberapa widget secara vertikal, misalnya pada form login, register, dan tampilan informasi pada halaman utama.
6. Row: Digunakan untuk menyusun widget secara horizontal, seperti pada tampilan menu, informasi saldo, serta elemen-elemen yang ditampilkan berdampingan.
7. Container: Digunakan sebagai pembungkus widget yang memungkinkan pemberian dekorasi seperti warna latar belakang, border, radius sudut, padding, dan bayangan agar tampilan lebih menarik.
8. Padding: Digunakan untuk memberikan jarak di dalam widget sehingga elemen tampilan tidak terlalu rapat dan terlihat lebih rapi.
9. SizedBox: Digunakan untuk memberikan jarak antar widget atau menentukan ukuran tertentu pada suatu komponen tampilan.
10. Center: Digunakan untuk memposisikan widget agar berada tepat di tengah layar, misalnya pada tampilan halaman login dan register.
11. Expanded: Digunakan agar suatu widget dapat mengisi ruang kosong yang tersedia dalam layout Row atau Column.
12. Spacer: Digunakan untuk memberikan ruang kosong fleksibel di antara widget sehingga tata letak menjadi lebih seimbang.
13. Stack: Digunakan untuk menumpuk beberapa widget secara berlapis, misalnya untuk membuat dekorasi background pada halaman login dan register.
14. Positioned: Digunakan dalam widget Stack untuk mengatur posisi spesifik suatu widget pada layar, seperti posisi dekorasi lingkaran pada background.
15. ConstrainedBox: Digunakan untuk membatasi ukuran maksimum suatu widget, sehingga tampilan aplikasi tetap rapi pada layar yang lebih besar.
16. Builder: Digunakan untuk membuat context baru ketika diperlukan dalam suatu bagian widget tertentu.

### C. Widget Input & Form
17. Form: Digunakan untuk membungkus beberapa input field sehingga dapat dilakukan proses validasi sebelum data dikirim atau diproses.
18. TextFormField: Digunakan sebagai komponen input teks yang memiliki fitur validasi, misalnya untuk mengisi email, password, jumlah transaksi, dan keterangan transaksi.
19. TextField: Digunakan sebagai input teks sederhana tanpa validasi khusus.

### D. Widget Teks & Icon
20. Text: Digunakan untuk menampilkan berbagai informasi teks dalam aplikasi seperti judul halaman, label input, keterangan transaksi, dan nilai saldo.
21. Icon: Digunakan untuk menampilkan ikon visual yang membantu memperjelas fungsi suatu komponen, seperti ikon dompet, kalender, tambah transaksi, dan lainnya.
22. CircleAvatar: Digunakan untuk menampilkan avatar berbentuk lingkaran yang berisi huruf pertama dari nama pengguna pada AppBar.

### E. Widget Tombol
23. ElevatedButton: Digunakan sebagai tombol utama dalam aplikasi, misalnya tombol login, register, atau tombol untuk menyimpan transaksi.
24. ElevatedButton.icon: Digunakan untuk tombol yang menampilkan ikon dan teks sekaligus, misalnya pada tombol hapus transaksi.
25. OutlinedButton: Digunakan sebagai tombol dengan garis tepi (border) tanpa warna latar, misalnya pada tombol kirim ulang email verifikasi.
26. OutlinedButton.icon: Digunakan sebagai tombol dengan kombinasi ikon dan teks dengan gaya outlined, seperti tombol kembali ke halaman login.
27. TextButton: Digunakan sebagai tombol berbentuk teks yang biasanya digunakan untuk navigasi ringan seperti menuju halaman register.
28. FloatingActionButton: Digunakan pada halaman utama untuk memberikan akses cepat kepada pengguna untuk menambahkan transaksi baru.
29. IconButton: Digunakan sebagai tombol berbentuk ikon, misalnya untuk logout, mengganti tema aplikasi, atau menampilkan dan menyembunyikan saldo.

### F. Widget List & Grid
30. ListView.builder: Digunakan untuk menampilkan daftar transaksi secara dinamis berdasarkan data yang diperoleh dari database.
31. GridView.builder: Digunakan untuk menampilkan kategori transaksi dalam bentuk grid sehingga pengguna dapat memilih kategori dengan lebih mudah.

### G. Widget Navigasi & Dialog
32. AlertDialog: Digunakan untuk menampilkan dialog konfirmasi sebelum melakukan tindakan penting seperti logout atau menghapus transaksi.
33. Dialog: Digunakan untuk menampilkan notifikasi khusus seperti pesan sukses setelah suatu operasi berhasil dilakukan.
34. BottomSheet: Digunakan untuk menampilkan detail transaksi dalam bentuk panel yang muncul dari bagian bawah layar.

### H. Widget Animasi
35. AnimatedSwitcher: Digunakan untuk memberikan efek animasi saat terjadi pergantian tampilan antara mode kalender dan mode daftar transaksi.
36. AnimatedContainer: Digunakan untuk membuat animasi perubahan properti seperti warna atau ukuran pada suatu widget.
37. AnimatedBuilder: Digunakan untuk membuat efek animasi khusus seperti efek getaran (shake) pada field password ketika login gagal.
38. SlideTransition: Digunakan untuk memberikan animasi pergeseran posisi widget saat berpindah tampilan.
39. FadeTransition: Digunakan untuk memberikan efek animasi transparansi saat widget muncul atau berganti.
40. Transform: Digunakan untuk mengubah posisi atau bentuk suatu widget, misalnya untuk membuat efek pergeseran pada animasi.

### I. Widget Scroll
41. SingleChildScrollView: Digunakan agar halaman dapat di-scroll ketika konten melebihi ukuran layar perangkat.

### J. Widget Utility
42. Card: Digunakan untuk menampilkan komponen dengan gaya material design berupa kartu yang memiliki bayangan dan sudut membulat.
43. Divider: Digunakan untuk membuat garis pemisah antar bagian tampilan agar informasi lebih terstruktur.
44. CircularProgressIndicator: Digunakan untuk menampilkan indikator loading ketika aplikasi sedang memproses suatu operasi seperti login atau registrasi.
45. ValueKey: Digunakan untuk memberikan identitas unik pada widget sehingga animasi dan perubahan state dapat diproses dengan benar.

### K. Widget GetX
46. Obx: Digunakan sebagai widget dari library GetX yang memungkinkan tampilan aplikasi diperbarui secara otomatis ketika nilai state berubah.

### L. Widget Package Tambahan
47. TableCalendar: Digunakan untuk menampilkan kalender interaktif yang memungkinkan pengguna memilih tanggal transaksi pada halaman utama aplikasi.

# Package

1. table_calendar: Digunakan untuk menampilkan kalender interaktif sehingga pengguna dapat memilih tanggal transaksi dan melihat data berdasarkan tanggal tertentu.
2. get: Digunakan untuk tiga fungsi utama yaitu navigasi antar halaman, pengelolaan state secara reaktif menggunakan Obx, serta menampilkan dialog atau snackbar.
3. supabase_flutter: Digunakan untuk melakukan autentikasi pengguna (login dan register), serta melakukan operasi database seperti mengambil, menambah, memperbarui, dan menghapus data transaksi.
4. flutter_dotenv: Digunakan untuk mengambil nilai `SUPABASE_URL` dan `SUPABASE_ANON_KEY` dari file `.env` saat aplikasi dijalankan.
5. url_launcher: Digunakan pada halaman verifikasi email untuk membuka aplikasi email pengguna seperti Gmail atau membuka layanan email melalui browser.
6. get_storage: Digunakan untuk menyimpan data kecil seperti pengaturan tema aplikasi (dark mode atau light mode) agar tetap tersimpan meskipun aplikasi ditutup.
