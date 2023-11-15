# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit cmake xdg


DESCRIPTION="A simple-to-use, cross-platform graphical interface for youtube-dl."
HOMEPAGE="https://github.com/JaGoLi/ytdl-gui"
SRC_URI="https://github.com/JaGoLi/ytdl-gui/archive/${PV}.tar.gz -> ytdl-gui-${PV}.tar.gz"
S="${WORKDIR}/ytdl-gui-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	net-misc/yt-dlp
"
RDEPEND="${DEPEND}"
