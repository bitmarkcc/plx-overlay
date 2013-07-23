# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Enhance your digital freedom"
HOMEPAGE="https://piratelinux.org"
SRC_URI="https://testing.piratelinux.org/repo/dist/${P}.tar.gz"

LICENSE="CC0"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

src_compile() {
	      emake
} 

src_install() {
	      dodir /opt/piratepack
	      emake DESTDIR="${D}" install
	      dosym /opt/piratepack/piratepack /usr/bin/piratepack
}
