# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit eutils distutils-r1

DESCRIPTION="Python IDE with matlab-like features"
HOMEPAGE="https://github.com/spyder-ide/spyder/ https://pypi.python.org/pypi/spyder/ http://pythonhosted.org/spyder/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc hdf5"

RDEPEND="
	|| ( dev-python/PyQt5[${PYTHON_USEDEP},svg,webkit]
		dev-python/PyQt4[${PYTHON_USEDEP},svg,webkit]
		dev-python/pyside[${PYTHON_USEDEP},svg,webkit] )
	dev-python/QtPy[${PYTHON_USEDEP},svg,webkit]
	dev-python/qtconsole[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/rope[${PYTHON_USEDEP}]' python2_7)
	$(python_gen_cond_dep 'dev-python/rope_py3k[${PYTHON_USEDEP}]' python3_4 python3_5)
	dev-python/jedi[${PYTHON_USEDEP}]
	dev-python/pyflakes[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/pylint[${PYTHON_USEDEP}]
	dev-python/pep8[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/nbconvert[${PYTHON_USEDEP}]
	dev-python/qtawesome[${PYTHON_USEDEP}]
	dev-python/pickleshare[${PYTHON_USEDEP}]
	dev-python/pyzmq[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	hdf5? ( dev-python/h5py[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	app-arch/unzip"

# Courtesy of Arfrever
PATCHES=( "${FILESDIR}"/${P}-build.patch )

python_compile_all() {
	if use doc; then
		sphinx-build doc doc/html || die "Generation of documentation failed"
	fi
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/html/. )
	distutils-r1_python_install_all
	doicon spyder/images/spyder.svg
	make_desktop_entry spyder Spyder spyder "Development;IDE"
}
