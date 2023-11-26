# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg desktop

DESCRIPTION="Boardview is a type of files containing information about printed circuit boards, their components, used signals, test points and more. These files may have following extensions: .asc, .bdv, .brd, .bv, .cad, .cst, .gr, .f2b, .fz. and others. "
HOMEPAGE="http://boardviewer.net/"
SRC_URI="https://github.com/NSThy/deb/releases/download/deb/BoardViewer-${PV}-wine.deb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /opt/boardviewer
	doins -r opt/boardviewer/*
	
	doicon -s scalable usr/share/icons/hicolor/scalable/apps/boardviewer.png
	
	domenu usr/share/applications/boardviewer.desktop
}
