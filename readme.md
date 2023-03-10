docker run \
    --net=host \
    -e TZ=Europe/Kiev \
    -v /home/mail/data:/data \
    --name "mailserver" \
    -h "mail.hostlike.pro" \
	-e "DISABLE_CLAMAV=TRUE" \
	-e "DISABLE_RSPAMD=TRUE" \
    -t analogic/poste.io