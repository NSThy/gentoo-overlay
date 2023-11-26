# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xdg desktop unpacker


DESCRIPTION="Play the world's number 1 online action game. Engage in an incredibly realistic brand of terrorist warfare in this wildly popular team-based game. "
HOMEPAGE="https://github.com/NSThy/deb"
SRC_URI="https://github.com/NSThy/deb/releases/download/deb/CounterStrike-${PV}-wine.deb"
S="${WORKDIR}"
RESTRICT="strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	virtual/wine
"
RDEPEND="${DEPEND}"


src_install(){
	insinto /opt
	doins -r opt/counterstrike-1.6
	
	doicon -s scalable usr/share/icons/hicolor/scalable/apps/counterstrike-1.6.png
	
	domenu usr/share/applications/counterstrike-1.6.desktop
	
	fperms 0755 /opt/counterstrike-1.6/runen
}
