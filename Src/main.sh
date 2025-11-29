#!/bin/bash
# input user#
echo "Masukkan folder sumber yang akan dibackup:"
read SOURCE

echo "Masukkan folder tujuan backup:"
read DEST

echo "Masukkan lama penyimpanan backup (hari):"
read RETENTION

# validasi direktori#

# cek folder sumber
if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder sumber tidak ditemukan!"
    exit 1
fi

# cek folder tujuan
if [ ! -d "$DEST" ]; then
    echo "Folder tujuan tidak ditemukan. Membuat folder..."
    mkdir -p "$DEST"
fi

LOGFILE="$DEST/backup.log"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_NAME="backup-$TIMESTAMP.tar.gz"
BACKUP_PATH="$DEST/$BACKUP_NAME"

START_TIME=$(date +"%Y-%m-%d %H:%M:%S")

echo "Folder sumber: $SOURCE"
echo "Folder tujuan: $DEST"
echo "Backup dimulai: $START_TIME"

# log start
echo "$START_TIME | Backup started: $SOURCE" >> "$LOGFILE"

# proses backup
tar -czf "$BACKUP_PATH" "$SOURCE"
STATUS=$?

END_TIME=$(date +"%Y-%m-%d %H:%M:%S")

if [ $STATUS -eq 0 ]; then
    FILE_SIZE=$(du -h "$BACKUP_PATH" | cut -f1)

    echo "Backup selesai: $BACKUP_NAME"
    echo "Ukuran backup: $FILE_SIZE"
    echo "Backup tersimpan di $DEST"

    echo "$END_TIME | Backup finished: $BACKUP_NAME" >> "$LOGFILE"
    echo "$END_TIME | Size: $FILE_SIZE | Status: SUCCESS" >> "$LOGFILE"
else
    echo "Backup gagal! Cek log di: $LOGFILE"
    echo "$END_TIME | Status: FAILED" >> "$LOGFILE"
    exit 1
fi

# rotasi backup
echo "Menghapus backup lebih dari $RETENTION hari..."
find "$DEST" -name "backup-*.tar.gz" -mtime +$RETENTION -exec rm {} \;
echo "Rotasi backup selesai."

exit 0