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

DEPEND=">=app-arch/zip-2
>=app-arch/unzip-5
>=sys-libs/zlib-1
>=virtual/jdk-1.5
>=dev-java/commons-logging-1.1
>=dev-java/ant-core-1.7
www-servers/tomcat:6"

RDEPEND=">=www-client/firefox-3
>=virtual/jdk-1.5
>=dev-java/commons-logging-1.1
www-servers/tomcat:6"

src_install() {

	dodir /opt/piratepack/packages/i2p/bin
	dodir /opt/piratepack/packages/i2p/share
	cp -r share/i2p-browser "${D}"/opt/piratepack/packages/i2p/share/

	cd gentoo
	./configure.sh
	cd ..

	cd setup/i2p-browser
	./install_i2p-browser.sh "${D}"/opt/piratepack/packages/i2p /opt/piratepack/packages/i2p

}
