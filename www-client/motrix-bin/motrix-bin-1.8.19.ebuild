# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xdg desktop rpm


DESCRIPTION="A simple-to-use, cross-platform graphical interface for youtube-dl."
HOMEPAGE="https://github.com/agalwood/Motrix"
SRC_URI="https://github.com/agalwood/Motrix/releases/download/v1.8.19/Motrix-${PV}.x86_64.rpm"
S="${WORKDIR}"
RESTRICT="strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	net-libs/nodejs
	sys-apps/yarn
"
RDEPEND="${DEPEND}"


src_install(){
	insinto /opt/Motrix
	doins -r opt/Motrix/*
	
	insinto /usr/share/mime/packages
	doins -r usr/share/mime/packages/motrix.xml
	
	doicon -s scalable usr/share/icons/hicolor/512x512/apps/motrix.png
	
	domenu usr/share/applications/motrix.desktop
	
	fperms 0755 /opt/Motrix/motrix
	fperms 0755 /opt/Motrix/chrome-sandbox
	fperms 0755 /opt/Motrix/chrome_crashpad_handler
	fperms 0755 /opt/Motrix/resources/engine/aria2c
}
