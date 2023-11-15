# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils

DESCRIPTION="A GNOME Shell extension that adds a blur look to different parts of the GNOME Shell, including the top panel, dash and overview."
HOMEPAGE="https://github.com/aunetx/blur-my-shell"
SRC_URI="https://github.com/aunetx/blur-my-shell/archive/v${PV}.tar.gz -> blur-my-shell-${PV}.tar.gz"
S="${WORKDIR}/blur-my-shell-${PV}"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 x86"

RDEPEND="
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.34
"
BDEPEND="
	app-misc/jq
"

extension_uuid="blur-my-shell@aunetx"

src_compile() {
	make
}

src_install() {
	unzip build/*.zip -d build/${extension_uuid}

	insinto /usr/share/gnome-shell/extensions/
	doins -r build/${extension_uuid}
	
	dodir /usr/share/glib-2.0/schemas
	mv "${ED}/usr/share/gnome-shell/extensions/${extension_uuid}"/schemas/ "${ED}/usr/share/glib-2.0" || die
	rm "${ED}/usr/share/glib-2.0/schemas/gschemas.compiled" || die
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}

pkg_postrm() {
	gnome2_schemas_update
}

