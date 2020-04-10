do_install_append () {
	install -D -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf
}

systemd_postinst_append() {
	systemctl --root=$D enable "wpa_supplicant@wlan0.service"
}

SYSTEMD_SERVICE_${PN}_append = " wpa_supplicant@wlan0.service"
