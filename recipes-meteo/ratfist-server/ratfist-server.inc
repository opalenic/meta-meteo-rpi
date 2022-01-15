# The server needs sqlite3 to build and run
DEPENDS = "sqlite3"

# Build both the server and the CLI tool
CARGO_BUILD_FLAGS += "--features meteo --bin ratfist-server --bin meteo-cli"

# Install the .env file and create an empty DB
SRC_URI_append = " file://ratfist-server.dotenv.in"
FILES_${PN} += "${localstatedir}/lib/ratfist-server/.env ${localstatedir}/lib/ratfist-server/ratfist.db"

do_install_append() {
  install -d ${D}/${localstatedir}/lib/ratfist-server
  install -m 0644 ${WORKDIR}/ratfist-server.dotenv.in ${D}/${localstatedir}/lib/ratfist-server/.env
  touch ${D}/${localstatedir}/lib/ratfist-server/ratfist.db
}

# Install the systemd service
inherit systemd

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE_${PN} = "ratfist-server.service"

SRC_URI_append = " file://ratfist-server.service "
FILES_${PN} += "${systemd_unitdir}/system/ratfist-server.service"

do_install_append() {
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/ratfist-server.service ${D}/${systemd_unitdir}/system
}
