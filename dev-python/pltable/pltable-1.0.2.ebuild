# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Python library for easily displaying tabular data in a visually appealing text table format"
HOMEPAGE="
	https://github.com/platomav/PLTable/
	https://pypi.org/project/PLTable/
"
SRC_URI="https://files.pythonhosted.org/packages/source/P/PLTable/PLTable-${PV}.tar.gz"
S="${WORKDIR}/PLTable-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~x86"

DEPEND="
	dev-lang/python
	dev-python/semantic-version
"
RDEPEND="
	${DEPEND}
"

