# Auto-Generated by cargo-bitbake 0.3.12
#
inherit cargo

# If this is git based prefer versioned ones if they exist
# DEFAULT_PREFERENCE = "-1"

# how to get test_cross could be as easy as but default to a git checkout:
# SRC_URI += "crate://crates.io/test_cross/0.1.0"
SRC_URI += "git://git@github.com/mour/test_cross.git;protocol=ssh;nobranch=1"
SRCREV = "2a0d5575086627fdf92fe07f4547c1f01c2d85b1"
S = "${WORKDIR}/git"
CARGO_SRC_DIR = ""
PV_append = ".AUTOINC+2a0d557508"

# please note if you have entries that do not begin with crate://
# you must change them to how that package can be fetched
SRC_URI += " \
"



# FIXME: update generateme with the real MD5 of the license file
LIC_FILES_CHKSUM = " \
    "

SUMMARY = "test_cross"
HOMEPAGE = "https://github.com/mour/test_cross.git"
LICENSE = "CLOSED"

# includes this file if it exists but does not fail
# this is useful for anything you may want to override from
# what cargo-bitbake generates.
include test_cross-${PV}.inc
include test_cross.inc
