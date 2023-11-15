# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 desktop xdg

DESCRIPTION="Linux SDL/ImGui edition software for viewing .brd files, intended as a drop-in replacement for the "Test_Link" software and "Landrex"."
HOMEPAGE="https://github.com/OpenBoardView/OpenBoardView"

EGIT_REPO_URI="https://github.com/OpenBoardView/OpenBoardView.git"
S="${WORKDIR}/${P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/cmake
	media-libs/libsdl2
	gui-libs/gtk
"
RDEPEND="${DEPEND}"

src_compile(){
	sh build.sh
}

src_install(){
	insinto /usr/share/mime/packages
	doins share/mime/packages/openboardview.xml

	insinto /usr/share/metainfo
	doins share/metainfo/openboardview.appdata.xml

	dobin bin/openboardview
	
	domenu share/applications/openboardview.desktop
	
	doicon -s scalable share/icons/hicolor/scalable/apps/openboardview.svg
}

