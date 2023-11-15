# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg desktop

DESCRIPTION="FreeFileSync is a folder comparison and synchronization software that creates and manages backup copies of all your important files. Instead of copying every file every time, FreeFileSync determines the differences between a source and a target folder and transfers only the minimum amount of data needed. FreeFileSync is Open Source software, available for Windows, macOS, and Linux."
HOMEPAGE="https://freefilesync.org/"
SRC_URI="https://freefilesync.org/download/FreeFileSync_${PV}_Linux.tar.gz"
RESTRICT="strip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="app-arch/unzip >=sys-devel/gcc-4.6"
RDEPEND="x11-libs/wxGTK dev-libs/boost"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {

	default
	
	offset=$(grep -abo -m 1 -F "<FFS_TAR_START>" "FreeFileSync_${PV}_Install.run" | cut -d : -f 1)
	offset=$((offset + 16))
	tail -c +$offset "FreeFileSync_${PV}_Install.run" > "FreeFileSync_${PV}_Install.tar"
	
	mkdir -p FreeFileSync_${PV}_Install_extracted
	tar -xf FreeFileSync_${PV}_Install.tar -C FreeFileSync_${PV}_Install_extracted --wildcards
	
	mkdir -p FreeFileSync_${PV}_Install_extracted/FreeFileSync_extracted
	tar -xzf FreeFileSync_${PV}_Install_extracted/FreeFileSync.tar.gz -C FreeFileSync_${PV}_Install_extracted/FreeFileSync_extracted
	
}

src_configure() {
	sed -i 's+FFS_INSTALL_PATH+/opt/FreeFileSync+g' FreeFileSync_${PV}_Install_extracted/FreeFileSync.template.desktop
	sed -i 's+FFS_INSTALL_PATH+/opt/FreeFileSync+g' FreeFileSync_${PV}_Install_extracted/RealTimeSync.template.desktop
	
	mv FreeFileSync_${PV}_Install_extracted/FreeFileSync.template.desktop FreeFileSync_${PV}_Install_extracted/FreeFileSync.desktop
	mv FreeFileSync_${PV}_Install_extracted/RealTimeSync.template.desktop FreeFileSync_${PV}_Install_extracted/RealTimeSync.desktop
}


src_install() {
	insinto /opt/FreeFileSync
	doins -r FreeFileSync_${PV}_Install_extracted/FreeFileSync_extracted/*
	
	fperms 0755 /opt/FreeFileSync/FreeFileSync
	fperms 0755 /opt/FreeFileSync/RealTimeSync
	fperms 0755 /opt/FreeFileSync/Bin/FreeFileSync_i686
	fperms 0755 /opt/FreeFileSync/Bin/FreeFileSync_x86_64
	fperms 0755 /opt/FreeFileSync/Bin/RealTimeSync_i686
	fperms 0755 /opt/FreeFileSync/Bin/RealTimeSync_x86_64
	
	doicon -s scalable FreeFileSync_${PV}_Install_extracted/FreeFileSync_extracted/Resources/FreeFileSync.png
	doicon -s scalable FreeFileSync_${PV}_Install_extracted/FreeFileSync_extracted/Resources/RealTimeSync.png
	
	domenu FreeFileSync_${PV}_Install_extracted/FreeFileSync.desktop
	domenu FreeFileSync_${PV}_Install_extracted/RealTimeSync.desktop
}
