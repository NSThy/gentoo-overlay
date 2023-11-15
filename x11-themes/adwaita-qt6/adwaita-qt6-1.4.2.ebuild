# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EXTRACTNAME="adwaita-qt"

DESCRIPTION="A native style to bend Qt5/Qt6 applications to look like they belong into GNOME Shell."
HOMEPAGE="https://github.com/FedoraQt/adwaita-qt"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${EXTRACTNAME}-${PV}.tar.gz"
S="${WORKDIR}/${EXTRACTNAME}-${PV}"

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
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DUSE_QT6=ON
	)
	cmake_src_configure
}


