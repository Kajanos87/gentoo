# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"
inherit gnome2

DESCRIPTION="Free replacements of Intel UPnP tools that use GUPnP"
HOMEPAGE="https://wiki.gnome.org/Projects/GUPnP"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

RDEPEND="
	>=dev-libs/glib-2.24:2
	>=dev-libs/libxml2-2.4:2
	>=net-libs/gssdp-0.13.3
	>=net-libs/gupnp-0.20.14
	>=net-libs/gupnp-av-0.5.5
	>=net-libs/libsoup-2.42:2.4
	>=x11-libs/gtk+-3.10:3
	>=x11-libs/gtksourceview-3.2:3.0
"
DEPEND="${RDEPEND}
	>=sys-devel/gettext-0.19.7
	virtual/pkgconfig
"

# Fixes 598284 with upstream patch
# https://git.gnome.org/browse/gupnp-tools/commit/?id=e9ec9634207e4c2eea6d268ee29b57e687c1f178
PATCHES=( "${FILESDIR}/${PN}-fix-compiling-when-using-recent-gupnp-av.patch" )
