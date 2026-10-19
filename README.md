# UTS_Daspro_The_Titut_A
🛒 KasirKu
KasirKu adalah aplikasi kasir toko mini berbasis konsol yang dibuat dengan bahasa Pascal. Program ini meniru alur kerja kasir sederhana: mencatat barang belanjaan, menghitung diskon secara otomatis, menampilkan struk, dan memproses pembayaran beserta kembaliannya.

Proyek ini dikembangkan sebagai tugas UTS Dasar Pemrograman dan menerapkan materi praktikum: input-output, pengkondisian, perulangan, kontrol perulangan, dan menu interaktif.

Anggota Kelompok:
Cut Syafira Nahfiz (261401020) Kom A, Lab 1
Naysha Iskandar (261401023) Kom A, Lab 1
El Nino Vincitore (261401117) Kom A, Lab 2

✨ Fitur Utama
1. Input Barang
Kasir memasukkan nama barang, harga satuan, dan jumlah beli secara berulang.

Logika singkat:
• Menggunakan perulangan while true yang terus berjalan sampai dihentikan.
• Mengetik selesai pada nama barang menghentikan input (break).
• Jika harga atau jumlah tidak valid (≤ 0), data dilewati dan input diulang (continue).
• Data valid disimpan ke array nama, harga, dan qty, lalu jumlah bertambah satu.

2. Struk Belanja & Diskon Otomatis
Menampilkan daftar belanjaan, total, diskon, dan total yang harus dibayar.

Logika singkat:
• Perulangan for-to-do mencetak setiap barang dan menjumlahkan subtotal (harga × jumlah).
• Diskon ditentukan dengan if-else bersarang
• Total bayar = subtotal − (subtotal × persen diskon ÷ 100).

3. Pembayaran
Memproses uang dari pelanggan dan menghitung kembalian.

Logika singkat:
• Perulangan while-do terus meminta uang selama nominal masih kurang dari total bayar.
• Setelah cukup, kembalian dihitung (uang − total bayar).
Keranjang direset (jumlah := 0) agar siap untuk pelanggan berikutnya.

4. Menu Interaktif
Pusat kendali program yang menampilkan pilihan fitur.

Logika singkat:
• Menu berjalan dengan repeat-until sehingga selalu tampil minimal sekali.
• Pilihan pengguna diarahkan ke prosedur terkait melalui case-of.
• Program berhenti saat pengguna memilih menu 4 (Keluar).
