do_compile_append () {
	cp ${WORKDIR}/wpa_supplicant.conf-sane ${WORKDIR}/wpa_supplicant-wlan0.conf

	# If configured, add network connection info to the default wpa supplicant file
	if [ -n "${METEO_RPI_WPA_SUPPLICANT_CONF}" ]; then
		echo -e "${METEO_RPI_WPA_SUPPLICANT_CONF}" >> ${WORKDIR}/wpa_supplicant-wlan0.conf
	fi
}

do_install_append () {
	install -D -m 600 ${WORKDIR}/wpa_supplicant-wlan0.conf ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf
}

systemd_postinst_append() {
	systemctl --root=$D enable "wpa_supplicant@wlan0.service"
}

SYSTEMD_SERVICE_${PN}_append = " wpa_supplicant@wlan0.service"
