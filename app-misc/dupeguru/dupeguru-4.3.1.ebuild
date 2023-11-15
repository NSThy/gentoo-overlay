# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xdg


DESCRIPTION="dupeGuru is a cross-platform (Linux, OS X, Windows) GUI tool to find duplicate files in a system. It is written mostly in Python 3 and uses qt for the UI."
HOMEPAGE="https://github.com/arsenetar/dupeguru"
SRC_URI="https://github.com/arsenetar/dupeguru/archive/${PV}.tar.gz -> dupeguru-${PV}.tar.gz"
S="${WORKDIR}/dupeguru-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-python/PyQt5
	dev-lang/python
	dev-python/pip
	media-libs/mutagen
	dev-python/polib
	dev-python/semantic-version
	dev-python/send2trash
	dev-python/xxhash
	dev-python/distro
	dev-python/sphinx
"
RDEPEND="${DEPEND}"

src_configure() {
	sed -i 's+NO_VENV ?=+NO_VENV = 1+g' Makefile
}
