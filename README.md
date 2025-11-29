# 4_Project_UAS_LabSO_B

# 🧩 8. Pembagian Tugas Kelompok

## 👤 *Inayah Kamila Nurman – Bagian Scripting (main.sh)*

*Jobdesk:* Membuat script utama program backup otomatis.

### Cara kerja main.sh:

1. Mengambil input dari user: folder sumber, folder tujuan, retention days.
2. Melakukan validasi pengecekan folder sumber dan tujuan.
3. Membuat file backup .tar.gz dengan timestamp unik.
4. Mencatat log mulai, selesai, ukuran file, dan status (success/failed).
5. Melakukan rotasi backup dengan menghapus file lama sesuai retention days.

> File: src/main.sh

---
