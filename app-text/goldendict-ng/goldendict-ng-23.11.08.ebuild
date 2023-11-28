# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake


DESCRIPTION="The Next Generation GoldenDict. A feature-rich open-source dictionary lookup program, supporting multiple dictionary formats and online dictionaries."
HOMEPAGE="https://github.com/xiaoyifang/goldendict-ng"
SRC_URI="https://github.com/xiaoyifang/goldendict-ng/archive/refs/tags/v${PV}-BeginningOfWinter.ff83be8a.tar.gz"
S="${WORKDIR}/goldendict-ng-${PV}-BeginningOfWinter.ff83be8a"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-qt/qtspeech-6
	dev-qt/qt5compat
	>=dev-qt/qtmultimedia-6
	>=dev-qt/qtwebengine-6
	app-arch/xz-utils
	dev-libs/lzo
	sys-libs/zlib
	app-arch/bzip2
	media-libs/libvorbis
	app-i18n/opencc
	app-text/hunspell
	dev-libs/xapian
	dev-libs/eb
	app-arch/libzim
"
RDEPEND="${DEPEND}"


src_configure() {	
	local mycmakeargs=(
		--install-prefix=/usr/
     		-DCMAKE_BUILD_TYPE=Release
	)
	cmake_src_configure
}


