# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR=EWATERS
MODULE_VERSION=0.101
inherit perl-module

DESCRIPTION="Preforking task dispatcher"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Error
	dev-perl/IO-Capture
	dev-perl/Params-Validate
	dev-perl/POE"
DEPEND="${RDEPEND}
	dev-perl/Module-Build"
