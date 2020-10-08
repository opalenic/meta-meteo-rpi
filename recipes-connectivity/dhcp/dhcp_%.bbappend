FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://dhclient-override.service"

do_install_append () {
	rm ${D}${systemd_unitdir}/system/dhclient.service
	install -m 0644 ${WORKDIR}/dhclient-override.service ${D}${systemd_unitdir}/system/dhclient.service
	sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/dhclient.service
}

SYSTEMD_AUTO_ENABLE_${PN}-client = "enable"