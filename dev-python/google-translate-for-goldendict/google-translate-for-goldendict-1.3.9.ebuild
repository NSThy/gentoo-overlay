# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Add Google translate to GoldenDict"
HOMEPAGE="
	https://github.com/xinebf/google-translate-for-goldendict/
	https://pypi.org/project/google-translate-for-goldendict/
"

SRC_URI="https://files.pythonhosted.org/packages/source/g/google-translate-for-goldendict/google-translate-for-goldendict-${PV}.tar.gz"
S="${WORKDIR}/google-translate-for-goldendict-${PV}"

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

