4_Project_UAS_LabSO_B

-Sistem Backup Otomatis (Shell Script)-

## 1. Deskripsi Program
Program ini adalah sistem backup otomatis berbasis Bash Shell Script yang dapat:
- Membackup folder
- Menyimpan hasil backup dengan timestamp
- Mencatat log aktivitas
- Melakukan rotasi backup berdasarkan retention days

Program berjalan pada Linux/WSL.

## 2. Fitur Utama
Validasi folder sumber & tujuan  
Folder tujuan dibuat otomatis jika belum ada  
Backup format: `backup-YYYYMMDD-HHMMSS.tar.gz`  
File log tersimpan di `backup.log`  
Rotasi backup otomatis  
Output jelas = sukses/gagal  

## 3. Cara Menjalankan
a. Masuk ke folder project
```bash
cd 4_Project_UAS_LabSO_B
```
b. Masuk ke folder src
```bash
cd src
```
c. Kasih izin eksekusi
```bash
chmod +x main.sh
```
d. Jalankan program
```bash
./main.sh
```

## 4. Contoh Input
```
Masukkan folder sumber yang akan dibackup: /home/Documents
Masukkan folder tujuan backup: /home/Auto-Backup/backup
Masukkan lama penyimpanan backup (hari): 7
```

## 5. Contoh Output
```
Folder sumber: /home/Documents
Folder tujuan: /home/Auto-Backup/backup
Backup dimulai: 2025-11-24 14:05:30
Backup selesai: backup-20251124-140530.tar.gz
Ukuran backup: 12.5 MB
Backup tersimpan di /home/Auto-Backup/backup
Backup lebih dari 7 hari dihapus (rotasi backup)
```

## 6. Contoh Isi Log
```
2025-11-24 14:05:30 | Backup started: /home/Documents
2025-11-24 14:05:45 | Backup finished: backup-20251124-140530.tar.gz
2025-11-24 14:05:45 | Size: 12.5 MB | Status: SUCCESS
```

## 7. Struktur Direktori
```
4_Project_UAS_LabSO_B
├── Backup/
├── Backup.log
├── README.md
├── Project.conf
└── Src/
    └── main.sh
```

## 8. Anggota Kelompok
- Inayah Kamila Nurman – 24081070100
- Brigita Hafidzah Agnil – 2408107010066
- Syifa Athiyya – 24081070100 

### Cara kerja main.sh:

1. Mengambil input dari user: folder sumber, folder tujuan, retention days.
2. Melakukan validasi pengecekan folder sumber dan tujuan.
3. Membuat file backup .tar.gz dengan timestamp unik.
4. Mencatat log mulai, selesai, ukuran file, dan status (success/failed).
5. Melakukan rotasi backup dengan menghapus file lama sesuai retention days.

# Laporan Testing Script

1. Test folder sumber tidak ada
   - Input: /folder/tidak/ada
   - Hasil: Script menampilkan error dan exit → BERHASIL

2. Test folder tujuan tidak ada
   - Script berhasil membuat folder tujuan otomatis → BERHASIL

3. Test backup normal
   - File backup-YYYYMMDD-HHMMSS.tar.gz muncul di folder backup → BERHASIL
   - Log tercatat lengkap → BERHASIL

4. Test rotasi backup
   - Set retention=0 → backup langsung terhapus
   - Rotasi sukses → BERHASIL
