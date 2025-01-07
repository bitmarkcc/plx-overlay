# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs

DESCRIPTION="User preference utility for XKB extensions for X"
HOMEPAGE="https://github.com/stephenmontgomerysmith/xkbset"
SRC_URI="https://plx.im/gentoo/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
IUSE="tk"

CDEPEND="
	x11-libs/libX11
"
DEPEND="
	${CDEPEND}
"
RDEPEND="
	${CDEPEND}
	tk? ( dev-perl/Tk )
"

S=${WORKDIR}/${P/_p*/}

PATCHES=(
	"${FILESDIR}"/clarify-errors.patch
)

src_compile() {
	emake CC="$(tc-getCC)" INC_PATH= LIB_PATH=
}

src_install() {
	dobin xkbset
	use tk && dobin xkbset-gui
	doman xkbset.1
	dodoc README TODO
}
