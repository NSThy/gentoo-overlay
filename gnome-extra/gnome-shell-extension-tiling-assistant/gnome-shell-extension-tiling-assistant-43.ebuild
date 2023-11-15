# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils

DESCRIPTION="Tiling Assistant is a GNOME Shell extension which adds a Windows-like snap assist to the GNOME desktop. It expands GNOME's 2 column tiling layout and adds many more features."
HOMEPAGE="https://github.com/Leleat/Tiling-Assistant"
SRC_URI="https://github.com/Leleat/Tiling-Assistant/archive/v${PV}.tar.gz -> Tiling-Assistant-${PV}.tar.gz"
S="${WORKDIR}/Tiling-Assistant-${PV}"


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

extension_uuid="tiling-assistant@leleat-on-github"

src_compile() {
	gnome-extensions pack tiling-assistant@leleat-on-github --force --podir="../translations" --extra-source="src" --extra-source="media"
}

src_install() {
	unzip *.zip -d ${extension_uuid}

	insinto /usr/share/gnome-shell/extensions/
	doins -r ${extension_uuid}
	
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

