# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="Enhance your digital freedom"
HOMEPAGE="https://piratelinux.org"
SRC_URI="https://piratelinux.org/repo/dist/${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+networkmanager +piratepack_sensors +piratepack_amule +piratepack_keyboard +piratepack_bittorrent +piratepack_bitcoind"

DEPEND=">=sys-devel/make-3
virtual/pkgconfig
>=sys-libs/zlib-1
x11-libs/gtk+:2
>=app-arch/zip-2
>=app-arch/unzip-5
>=app-misc/cwallet-1
>=net-misc/piratepack-i2p-1
>=net-im/pidgin-2
>=x11-plugins/pidgin-otr-3
"

RDEPEND=">=sys-libs/zlib-1
>=www-client/firefox-3
>=media-video/ffmpeg-1
>=media-gfx/imagemagick-6
>=app-misc/cwallet-1
>=net-misc/piratepack-i2p-1
>=net-misc/vidalia-0.2
>=net-proxy/polipo-1
piratepack_bitcoind? ( >=net-p2p/bitcoind-0.8.1 )
>=net-im/pidgin-2
>=x11-plugins/pidgin-otr-3
networkmanager? ( >=net-misc/networkmanager-openvpn-0.9 )
piratepack_sensors? ( >=sys-apps/lm_sensors-3 )
piratepack_amule? ( >=net-p2p/amule-2[upnp] )
piratepack_keyboard? ( >=x11-misc/matchbox-keyboard-0.1 )
piratepack_bittorrent? ( >=net-p2p/transmission-2 )
"

src_configure() {
	cd piratepack || die
	econf
	cd .. || die
}

src_compile() {
	cd piratepack || die
	emake
	cd .. || die
}

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

	./install_piratepack.sh /opt/piratepack "${D}" || die

	maindir_fin=$(cat maindir_min) || die
	cd "{D}"/opt/piratepack/packages || die
	while read -r line
	do
		cd "$line"/bin
		while read -r line2
		do
			dosym /opt/piratepack/packages/"$line"/bin/"$line2" "$maindir_fin"/bin/"$line2"
		done < <(find * -maxdepth 0)
		cd ../
		cd share
		while read -r line2
		do
			dosym /opt/piratepack/packages/"$line"/share/"$line2" "$maindir"/share/"$line2"
		done < <(find * -maxdepth 0)
		cd ../../
	done < <(find * -maxdepth 0 -type d)

	dosym "$maindir"/bin/piratepack /opt/piratepack/bin/piratepack
	dosym "$maindir"/bin/piratepack-refresh /opt/piratepack/bin/piratepack-refresh
	dosym "$maindir"/bin-pack /opt/piratepack/bin-pack

	dosym /opt/piratepack/bin/piratepack /usr/bin/piratepack
	dosym /opt/piratepack/bin/piratepack-refresh /usr/bin/piratepack-refresh
	dodir /etc/profile.d
	install -m 644 profile.sh "${D}"/etc/profile.d/piratepack.sh || die
}
