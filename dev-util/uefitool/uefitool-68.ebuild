# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PV=A${PV}


inherit cmake xdg


DESCRIPTION="UEFI firmware image viewer and editor"
HOMEPAGE="https://github.com/LongSoft/UEFITool"
SRC_URI="https://github.com/LongSoft/UEFITool/archive/${PV}.tar.gz -> UEFITool-${PV}.tar.gz"
S="${WORKDIR}/UEFITool-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-util/cmake
"
RDEPEND="${DEPEND}"

src_prepare(){
	sed -i 's/^Exec=uefitool$/Exec=uefitool %F/' UEFITool/uefitool.desktop
	cmake_src_prepare
}
