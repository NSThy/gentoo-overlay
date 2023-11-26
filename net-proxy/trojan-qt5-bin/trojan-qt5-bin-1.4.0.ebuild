# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xdg desktop unpacker


DESCRIPTION="A cross-platform Socks5/Http/SS/SSR/Vmess/Trojan(go)/Snell GUI client. "
HOMEPAGE="https://github.com/NSThy/deb"
SRC_URI="https://github.com/NSThy/deb/releases/download/deb/Trojan-QT5-${PV}-deb-amd64.deb"
S="${WORKDIR}"
RESTRICT="strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="

"
RDEPEND="${DEPEND}"


src_install(){
	insinto /opt
	doins -r opt/trojan-qt5
	
	doicon -s scalable usr/share/icons/hicolor/scalable/apps/trojan-qt5.png
	
	domenu usr/share/applications/trojan-qt5.desktop
	
	fperms 0755 /opt/trojan-qt5/bin/trojan-qt5
}
