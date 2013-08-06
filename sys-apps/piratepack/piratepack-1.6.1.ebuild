# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="Enhance your digital freedom"
HOMEPAGE="https://piratelinux.org"
SRC_URI="https://testing.piratelinux.org/repo/dist/${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="gtk"

DEPEND="gtk? ( x11-libs/gtk+:2 )
>=app-arch/zip-2
>=app-arch/unzip-5
>=sys-libs/zlib-1
>=dev-util/cmake-2"

RDEPEND=">=www-client/firefox-3
>=media-video/ffmpeg-1
>=media-gfx/imagemagick-6
>=app-misc/cwallet-1
>=net-misc/vidalia-0.2
>=net-proxy/polipo-1"

src_install() {
	./install_piratepack.sh "${D}"/opt/piratepack /opt/piratepack
}
