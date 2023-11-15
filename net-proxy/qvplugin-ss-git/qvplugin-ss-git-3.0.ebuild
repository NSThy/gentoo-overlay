# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake desktop

DESCRIPTION="ShadowSocks plugin for Qv2ray, use this plugin to enable full SIP003 support in Qv2ray"
HOMEPAGE="https://github.com/Qv2ray/QvPlugin-SS"

EGIT_REPO_URI="https://github.com/Qv2ray/QvPlugin-SS.git"
S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="

"
RDEPEND="${DEPEND}"

src_configure() {
	sed -i 's+static constexpr std::size_t sigStackSize = 32768 >= MINSIGSTKSZ ? 32768 : MINSIGSTKSZ;+static constexpr std::size_t sigStackSize = 32768;+g' ${S}/3rdparty/shadowsocks-uvw/test/catch.hpp
	sed -i 's+static constexpr std::size_t sigStackSize = 32768 >= MINSIGSTKSZ ? 32768 : MINSIGSTKSZ;+static constexpr std::size_t sigStackSize = 32768;+g' ${S}/test/catch.hpp
	mkdir build && cd build
	cmake ..
	S="${S}/build"
}

src_compile() {
	cmake --build .
}

src_install() {
	insinto /usr/share/qv2ray/plugins
	doins -r ${S}/libQvPlugin-SS.so
}
	

