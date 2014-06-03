# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="Script that sets up the Xfce Configuration for Pirate Linux"
HOMEPAGE="https://piratelinux.org"
SRC_URI="https://piratelinux.org/repo/dist/${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=xfce-extra/xfce4-battery-plugin-1
>=x11-themes/gnome-themes-standard-3"

src_install() {
	dodir /usr/bin
	dodir /etc/xdg/autostart
	install -m 755 piratelinux-xfconf "${D}"/usr/bin/piratelinux-xfconf || die
	install -m 644 piratelinux-xfconf.desktop "${D}"/etc/xdg/autostart/piratelinux-xfconf.desktop || die
}
