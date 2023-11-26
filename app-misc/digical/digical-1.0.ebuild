# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg desktop

DESCRIPTION="Circuit calculator"
HOMEPAGE="https://www.chinafix.com/"
SRC_URI="https://github.com/NSThy/deb/releases/download/deb/Digical-${PV}-wine.deb"


LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /opt/digical/
	doins -r opt/digical/*
	
	doicon -s scalable usr/share/icons/hicolor/scalable/apps/digical.png
	
	domenu usr/share/applications/digical.desktop
}
