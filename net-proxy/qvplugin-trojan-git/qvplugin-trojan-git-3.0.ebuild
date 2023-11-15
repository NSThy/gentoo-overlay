# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Use Trojan-GFW in Qv2ray."
HOMEPAGE="https://github.com/Qv2ray/QvPlugin-Trojan"

EGIT_REPO_URI="https://github.com/Qv2ray/QvPlugin-Trojan.git"
S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="

"
RDEPEND="${DEPEND}"
