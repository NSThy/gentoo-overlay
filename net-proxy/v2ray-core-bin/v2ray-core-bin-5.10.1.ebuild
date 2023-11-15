# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Project V is a set of network tools that helps you to build your own computer network. It secures your network connections and thus protects your privacy."
HOMEPAGE="https://github.com/v2fly/v2ray-core"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/v2ray-linux-64.zip"
S="${WORKDIR}"
RESTRICT="strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/qv2ray/vcore
	doins -r ge*
	doins -r vp*
	doins -r config.json
	
	exeinto /usr/share/qv2ray/vcore
	doexe v2ray
}
