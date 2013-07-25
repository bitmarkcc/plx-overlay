# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="See your (crypto) wallet"
HOMEPAGE="https://github.com/piratelinux/cwallet"
SRC_URI="https://testing.piratelinux.org/repo/dist/${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="gtk"

DEPEND="gtk? ( x11-libs/gtk+:2 )
sys-libs/db:4.8
>=dev-libs/openssl-0.9"

RDEPEND=">=media-gfx/imagemagick-6
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
	dodir /usr/bin
	install -o root -g root -m 755 src/cwallet "${D}"/usr/bin/cwallet
	if use gtk
	then
		emake DESTDIR="${D}" install
	fi
}
