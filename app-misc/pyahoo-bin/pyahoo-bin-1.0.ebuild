# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xdg desktop unpacker


DESCRIPTION=" A small tool to display stocks and cryptos from yahoo. "
HOMEPAGE="https://github.com/NSThy/deb"
SRC_URI="https://github.com/NSThy/deb/releases/download/linux/pyahoo-${PV}-amd64.deb"
S="${WORKDIR}"
RESTRICT="strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	<=dev-python/certifi-2023.11.17
	dev-python/multitasking 
	dev-python/yfinance 
	dev-python/frozendict 
	dev-python/pandas 
	dev-python/peewee 
	dev-python/pytz 
	dev-python/tzdata
	dev-lang/python:=[tk]
"
RDEPEND="${DEPEND}"


src_install(){
	dobin usr/bin/pyahoo.py
	
	doicon -s scalable usr/share/icons/hicolor/scalable/apps/pyahoo.png
	
	domenu usr/share/applications/pyahoo.desktop
}
