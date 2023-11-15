# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="PyInstaller bundles a Python application and all its dependencies into a single package."
HOMEPAGE="
	https://github.com/pyinstaller/pyinstaller/
	https://pypi.org/project/pyinstaller/
"

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

