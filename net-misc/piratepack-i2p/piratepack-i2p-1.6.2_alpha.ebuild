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

DEPEND=">=sys-devel/make-3
virtual/pkgconfig
>=sys-libs/zlib-1
>=virtual/jdk-1.5
>=app-arch/zip-2
>=app-arch/unzip-5
>=dev-java/commons-logging-1.1
>=dev-java/ant-core-1.7
www-servers/tomcat:6"

RDEPEND=">=www-client/firefox-3
>=virtual/jdk-1.5
>=dev-java/commons-logging-1.1
www-servers/tomcat:6"

src_compile() {
	mkdir dest
	mkdir dest/bin
	mkdir dest/share
	cp -r share/i2p-browser dest/share/

	cd gentoo
	./configure.sh
	cd ..

	cd setup/i2p-browser
	./install_i2p-browser.sh "${S}"/dest /opt/piratepack/packages/i2p
}

src_install() {
	dodir /opt/piratepack/packages/

	mv dest "${D}"/opt/piratepack/packages/i2p
}
