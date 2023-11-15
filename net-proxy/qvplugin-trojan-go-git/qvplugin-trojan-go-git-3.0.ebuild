# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Trojan-Go plugin for Qv2ray v2.6+"
HOMEPAGE="https://github.com/Qv2ray/QvPlugin-Trojan-Go"

EGIT_REPO_URI="https://github.com/Qv2ray/QvPlugin-Trojan-Go.git"
S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"
