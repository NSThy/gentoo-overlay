# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils git-r3 meson

DESCRIPTION="Automatically toggle your desktop’s color scheme between light and dark, switch backgrounds and run custom commands at sunset and sunrise."
HOMEPAGE="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"

EGIT_REPO_URI="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension.git"
S="${WORKDIR}/${P}"


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

