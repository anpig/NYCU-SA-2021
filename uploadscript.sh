#! /bin/sh
violated=0
(echo "$1" | grep -Eq .exe$) && violated=1
if [ $violated -eq 1 ]; then
    ip=$(grep uploaded /var/log/pureftpd/pureftpd.log | tail -1 | cut -d@ -f2 | cut -d')' -f1)
    mv "$1" /home/ftp/hidden/.exe/
    logger -t ftpuscr -p local0.info "$1 violate file detected. Uploaded by $UPLOAD_VUSER. From $ip."
fi