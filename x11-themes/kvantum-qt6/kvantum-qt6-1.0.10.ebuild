# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EXTRACTNAME="Kvantum"

DESCRIPTION="Kvantum (by Pedram Pourang, a.k.a. Tsu Jan) is an SVG-based theme engine for Qt, tuned to KDE and LXQt, with an emphasis on elegance, usability and practicality."
HOMEPAGE="https://github.com/tsujan/Kvantum"
SRC_URI="${HOMEPAGE}/archive/refs/tags/V${PV}.tar.gz -> ${EXTRACTNAME}-${PV}.tar.gz"
S="${WORKDIR}/${EXTRACTNAME}-${PV}/Kvantum"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtbase:6
"
RDEPEND="${DEPEND}"


src_configure() {
	sed 's|Qt6 Qt5|Qt6|' -i style/CMakeLists.txt
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DENABLE_QT5=OFF
	)
	cmake_src_configure
}

