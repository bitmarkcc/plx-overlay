# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="See your (crypto) wallet"
HOMEPAGE="https://github.com/piratelinux/cwallet"
SRC_URI="https://piratelinux.org/repo/dist/${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="gtk"

DEPEND=">=sys-devel/make-3
virtual/pkgconfig
gtk? ( x11-libs/gtk+:2 )
sys-libs/db:4.8
>=dev-libs/openssl-0.9"

RDEPEND="${DEPEND}
>=media-gfx/imagemagick-6
>=media-gfx/qrencode-3"

src_configure() {
	if use gtk
	then
		econf
	fi
}

src_compile() {
	cd src
	emake -f makefile.static
	cd ..
	if use gtk
	then
		emake
	fi
}

src_install() {
	dodir /opt/piratepack/packages/cwallet/bin
	dodir /opt/piratepack/packages/cwallet/share/cwallet_build
	install -m 755 src/cwallet "${D}"/opt/piratepack/packages/cwallet/share/cwallet_build/cwallet
	install -m 644 src/logo.png "${D}"/opt/piratepack/packages/cwallet/share/cwallet_build/logo.png
	install -m 644 src/icon.png "${D}"/opt/piratepack/packages/cwallet/share/cwallet_build/icon.png
	dosym /opt/piratepack/packages/cwallet/share/cwallet_build/cwallet /opt/piratepack/packages/cwallet/bin/cwallet
	if use gtk
	then
		install -m 755 src/cwallet-gui "${D}"/opt/piratepack/packages/cwallet/share/cwallet_build/cwallet-gui
		dosym /opt/piratepack/packages/cwallet/share/cwallet_build/cwallet-gui /opt/piratepack/packages/cwallet/bin/cwallet-gui
	fi
}
