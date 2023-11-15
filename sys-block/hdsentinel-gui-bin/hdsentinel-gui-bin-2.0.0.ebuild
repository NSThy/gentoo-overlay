# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg desktop

DESCRIPTION="Hard Disk Sentinel (HDSentinel) is a multi-OS SSD and HDD monitoring and analysis software. Its goal is to find, test, diagnose and repair hard disk drive problems, report and display SSD and HDD health, performance degradations and failures. Hard Disk Sentinel gives complete textual description, tips and displays/reports the most comprehensive information about the hard disks and solid state disks inside the computer and in external enclosures (USB hard disks / e-SATA hard disks). Many different alerts and report options are available to ensure maximum safety of your valuable data."
HOMEPAGE="https://www.hdsentinel.com/"
SRC_URI="https://www.hdsentinel.com/hdslin/hdsentinel_gui64bit.tar.xz"
RESTRICT="strip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	app-arch/unzip 
	>=sys-devel/gcc-4.6
"

RDEPEND="
	x11-libs/wxGTK 
	dev-libs/boost
"

BDEPEND=""

S="${WORKDIR}"

src_unpack() {

	default
	
	unpack_zip HDSentinel_GUI/HDSentinel_GUI.zip
}

src_configure() {

	sed -i 's+/usr/share/bin/+/usr/bin/+g' HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop
	sed -i 's+/usr/share/icons/HDSentinel_GUI.ico+HDSentinel_GUI+g' HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop
	
	convert HDSentinel_GUI/HDSentinel_GUI.ico HDSentinel_GUI/HDSentinel_GUI.png
	mv HDSentinel_GUI/HDSentinel_GUI-0.png HDSentinel_GUI/HDSentinel_GUI.png
}


src_install() {
	
	dobin HDSentinel_GUI/HDSentinel
	dobin HDSentinel_GUI/HDSentinel_GUI

	doicon -s scalable HDSentinel_GUI/HDSentinel_GUI.png
	
	domenu HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop
}
