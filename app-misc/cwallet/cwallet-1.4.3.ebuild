# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
DESCRIPTION="Cryptocurrency wallet viewer and paper wallet creator"
HOMEPAGE="https://plx.im"
SRC_URI="https://plx.im/${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="gtk"

DEPEND="virtual/pkgconfig
>=sys-libs/zlib-1
gtk? ( x11-libs/gtk+:2 )
sys-libs/db:4.8
>=dev-libs/openssl-1.0.0h"

RDEPEND=">=sys-libs/zlib-1
gtk? ( x11-libs/gtk+:2 )
sys-libs/db:4.8
>=dev-libs/openssl-1.0.0h
>=media-gfx/qrencode-3[png]
>=app-text/texlive-2012"

inherit autotools

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable gtk gui)
}

src_compile() {
	emake
}

src_install() {
	dodir /usr/bin
	dodir /usr/share/images
	dodir /usr/share/pixmaps
	install -m 755 src/cwallet "${D}"/usr/bin/cwallet || die
	install -m 644 cwallet-logo.png "${D}"/usr/share/images/cwallet-logo.png || die
	install -m 644 cwallet-gui.png "${D}"/usr/share/pixmaps/cwallet-gui.png || die
	if use gtk
	then
		install -m 755 src/cwallet-gui "${D}"/usr/bin/cwallet-gui || die
	fi
}
