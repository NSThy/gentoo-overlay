# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The EB library is a C library for accessing CD-ROM books.
It can run on UNIX-like OS and Windows (2000 or later) systems.
to come. (However, a separate package is required to compile on Windows.)"
HOMEPAGE="https://github.com/mistydemeo/eb"
SRC_URI="https://github.com/mistydemeo/eb/archive/refs/tags/v${PV}.tar.gz"
S="${WORKDIR}/eb-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	sys-libs/zlib
	dev-lang/perl
	!dev-libs/eb
"
RDEPEND="${DEPEND}"


