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
>=media-gfx/qrencode-3
>=app-text/texlive-2012"

src_configure() {
	econf
}

src_compile() {
	emake
}

src_install() {
	dodir /opt/cwallet/bin
	dodir /opt/cwallet/share/cwallet_build
	install -m 755 src/cwallet "${D}"/opt/cwallet/share/cwallet_build/cwallet || die
	install -m 644 src/logo.png "${D}"/opt/cwallet/share/cwallet_build/logo.png || die
	install -m 644 src/icon.png "${D}"/opt/cwallet/share/cwallet_build/icon.png || die
	dosym /opt/cwallet/share/cwallet_build/cwallet /usr/bin/cwallet
	if use gtk
	then
		install -m 755 src/cwallet-gui "${D}"/opt/cwallet/share/cwallet_build/cwallet-gui || die
		dosym /opt/cwallet/share/cwallet_build/cwallet-gui /usr/bin/cwallet-gui
	fi
}
