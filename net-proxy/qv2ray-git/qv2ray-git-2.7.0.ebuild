# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Cross-platform V2Ray client using the Qt framework. Support Windows, Linux, macOS
Plug-in system supports SSR/Trojan/Trojan-Go/NaiveProxy"
HOMEPAGE="https://github.com/Qv2ray/Qv2ray"

EGIT_REPO_URI="https://github.com/Qv2ray/Qv2ray.git"
S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	net-libs/mbedtls
	net-libs/grpc
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"


