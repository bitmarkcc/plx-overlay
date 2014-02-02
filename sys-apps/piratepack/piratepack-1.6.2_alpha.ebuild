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
IUSE="+networkmanager"

DEPEND="x11-libs/gtk+:2
>=app-arch/zip-2
>=app-arch/unzip-5
>=sys-libs/zlib-1
>=dev-util/cmake-2
>=app-misc/cwallet-1
>=net-misc/piratepack-i2p-1
>=net-im/pidgin-2[-gstreamer]
>=x11-plugins/pidgin-otr-3
"

RDEPEND=">=www-client/firefox-3
>=media-video/ffmpeg-1
>=media-gfx/imagemagick-6
>=app-misc/cwallet-1
>=net-misc/piratepack-i2p-1
>=net-misc/vidalia-0.2
>=net-proxy/polipo-1
>=net-p2p/bitcoind-0.8.1
>=net-im/pidgin-2[-gstreamer]
>=x11-plugins/pidgin-otr-3
networkmanager? ( >=net-misc/networkmanager-openvpn-0.9 )
"

src_install() {
	dodir /usr/share/applications
	dodir /etc/xdg/autostart
	dodir /usr/share/pixmaps
	dodir /usr/share/icons/hicolor/16x16/apps
	dodir /usr/share/icons/hicolor/22x22/apps
	dodir /usr/share/icons/hicolor/32x32/apps
	dodir /usr/share/icons/hicolor/48x48/apps
	dodir /usr/share/icons/hicolor/64x64/apps
	dodir /usr/share/icons/hicolor/128x128/apps
	./install_piratepack.sh /opt/piratepack "${D}"
	dosym /opt/piratepack/bin/piratepack /usr/bin/piratepack
	dosym /opt/piratepack/bin/piratepack-refresh /usr/bin/piratepack-refresh
	dodir /etc/profile.d
	install -m 644 profile.sh "${D}"/etc/profile.d/piratepack.sh
}
