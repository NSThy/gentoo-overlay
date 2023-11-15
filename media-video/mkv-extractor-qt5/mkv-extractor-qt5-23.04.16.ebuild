# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

EXTRACTNAME="MKV-Extractor-Qt5"

DESCRIPTION="MKV Extracto Qt5 is written in python3 + Qt5 and works for Linux. It is to be used in addition to MKVToolNix MKVToolNix."
HOMEPAGE="https://github.com/Hizoka76/MKV-Extractor-Qt5"
SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz -> ${EXTRACTNAME}-${PV}.tar.gz"
S="${WORKDIR}/${EXTRACTNAME}-${PV}"


LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-lang/python
	dev-python/PyQt5
	media-video/mkvalidator
	media-video/mkvtoolnix
	media-video/mkclean
	dev-python/psutil
	dev-python/pip
"
RDEPEND="${DEPEND}"

src_configure() {
sed -i 's+/usr/lib/x86_64-linux-gnu/qt5/bin/lrelease+/usr/lib64/qt5/bin/lrelease+g' build.sh
}


src_compile() {
	chmod +x ${S}/build.sh
	${S}/build.sh
	
	sed -i 's+Exec=mkv-extractor-qt5 %U+Exec=/opt/mkv-extractor-qt5/MKVExtractorQt5.py %U+g' mkv-extractor-qt5.desktop
	sed -i 's+TryExec=mkv-extractor-qt5++g' mkv-extractor-qt5.desktop
	sed -i 's+Icon=/usr/share/icons/hicolor/scalable/apps/mkv-extractor-qt5.svg+Icon=mkv-extractor-qt5+g' mkv-extractor-qt5.desktop
}

src_install() {
	insinto /opt/mkv-extractor-qt5
	doins -r ui_MKVExtractorQt5.ui
	doins -r ui_MKVExtractorQt5.py
	doins -r MKVRessources_rc.py
	doins -r MKVRessources.qrc
	doins -r CodecListFile.py
	doins -r Languages
	doins -r QFileDialogCustom
	doins -r WhatsUp
	doins -r man
	doins -r img
	
	exeinto /opt/mkv-extractor-qt5
	doexe MKVExtractorQt5.py
	
	doicon -s scalable icons/mkv-extractor-qt5.svg
	
	domenu mkv-extractor-qt5.desktop
}

