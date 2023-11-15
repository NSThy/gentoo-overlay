# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg desktop qmake-utils

EXTRACTNAME="OCAuxiliaryTools"

DESCRIPTION="OpenCore Auxiliary Tools is a GUI-based Configurator for editing config.plist files for Acidanthera's OpenCore Boot Manager."
HOMEPAGE="https://github.com/ic005k/OCAuxiliaryTools"
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
	dev-qt/qtnetwork
"
RDEPEND="${DEPEND}"


src_compile() {
	eqmake5 OCAuxiliaryTools.pro
	emake
	
	mv default.desktop OCAuxiliaryTools.desktop
	mv icon.png ocauxiliarytools.png
	
	sed -i 's+Icon=icon+Icon=ocauxiliarytools+g' OCAuxiliaryTools.desktop
	sed -i 's+Exec=OCAuxiliaryTools+Exec=/opt/ocauxiliarytools/OCAuxiliaryTools+g' OCAuxiliaryTools.desktop
	sed -i 's+Terminal=true+Terminal=false+g' OCAuxiliaryTools.desktop
	sed -i 's+Categories=Application+Categories=Utility+g' OCAuxiliaryTools.desktop
	
}

src_install() {
	insinto /opt/ocauxiliarytools
	doins -r Database
	
	exeinto /opt/ocauxiliarytools
	doexe bin/release/OCAuxiliaryTools
	
	doicon -s scalable ocauxiliarytools.png
	
	domenu OCAuxiliaryTools.desktop
}


