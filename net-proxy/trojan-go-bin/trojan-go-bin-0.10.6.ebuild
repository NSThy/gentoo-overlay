# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="A complete Trojan agent implemented in Go, compatible with the original Trojan protocol and configuration file format. Safe, efficient, lightweight and easy to use."
HOMEPAGE="https://github.com/p4gefau1t/trojan-go"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/trojan-go-linux-amd64.zip"
S="${WORKDIR}"
RESTRICT="strip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/trojan-go
	doins -r ge*
	doins -r example
	
	exeinto /usr/share/trojan-go
	doexe trojan-go
}
