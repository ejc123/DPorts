# $FreeBSD$

PORTNAME=	gcc
PORTVERSION=	4.9.1
PORTREVISION?=	1
CATEGORIES=	devel
MASTER_SITES=	GCC
MASTER_SITE_SUBDIR=	releases/gcc-${DISTVERSION}
PKGNAMEPREFIX?=	powerpc64-

MAINTAINER=	bapt@FreeBSD.org
COMMENT=	Cross GNU Compiler Collection for ${PKGNAMEPREFIX:C/-//g}

LICENSE=	GPLv3 GPLv3RLE
LICENSE_COMB=	multi

USES=	gmake iconv libtool tar:bzip2 makeinfo compiler
PLIST_SUB=	TARGETARCH=${PKGNAMEPREFIX:C/-//g} \
		GCC_TARGET=${GCC_TARGET}

LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp \
		libmpfr.so:${PORTSDIR}/math/mpfr \
		libmpc.so:${PORTSDIR}/math/mpc
BUILD_DEPENDS=	${BU_PREFIX}-as:${PORTSDIR}/devel/${PKGNAMEPREFIX}binutils
RUN_DEPENDS=	${BU_PREFIX}-as:${PORTSDIR}/devel/${PKGNAMEPREFIX}binutils

PATCH_WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION}
WRKSRC=	${WRKDIR}/build-gcc

.if empty(GCC_TARGET)
# We are building for a FreeBSD target
GCC_TARGET?=	${PKGNAMEPREFIX}portbld-freebsd10
BU_PREFIX?=	${PKGNAMEPREFIX}freebsd
EXTRA_PATCHES+= ${FILESDIR}/freebsd-format-extensions
PLIST_SUB+=	OPSYS=freebsd OSREL=10
.else
BU_PREFIX?=	${GCC_TARGET}
.if defined(FREEBSD_EXTENSION)
EXTRA_PATCHES+= ${FILESDIR}/freebsd-format-extensions
PLIST_SUB+=	OPSYS=${OPSYS:tl} OSREL=${OSREL}
.endif
.endif

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--target=${GCC_TARGET} --disable-nls --enable-languages=c,c++ \
		--without-headers \
		--with-gmp=${LOCALBASE} \
		--with-pkgversion="FreeBSD Ports Collection for ${PKGNAMEPREFIX:C/-//g}" \
		--with-system-zlib \
		--with-as=${LOCALBASE}/bin/${BU_PREFIX}-as \
		--with-ld=${LOCALBASE}/bin/${BU_PREFIX}-ld

CONFIGURE_SCRIPT=	../${PORTNAME}-${PORTVERSION}/configure

ALL_TARGET?=	all-gcc
INSTALL_TARGET?=	install-gcc

.include <bsd.port.pre.mk>

.if ${ARCH} == "x86_64"
CONFIGURE_TARGET=	x86_64-portbld-${OPSYS:tl}${OSREL}
.else
CONFIGURE_TARGET=	${ARCH}-portbld-${OPSYS:tl}${OSREL}
.endif

post-extract:
	@${MKDIR} ${WRKSRC}

post-stage:
	@if [ -f ${STAGEDIR}${PREFIX}/bin/cpp ] ; then \
		mv ${STAGEDIR}${PREFIX}/bin/cpp  \
		    ${STAGEDIR}${PREFIX}/bin/${GCC_TARGET}-cpp ; \
	fi
.for f in c++ cpp g++ gcc gcc-ar gcc-nm gcc-ranlib gcov
	@${RM} ${STAGEDIR}${PREFIX}/bin/$f
	@${RM} ${STAGEDIR}${PREFIX}/man/man1/$f.1.gz
.endfor
	@${RM} ${STAGEDIR}${PREFIX}/info/*
	@${RM} ${STAGEDIR}${PREFIX}/man/man7/*

.include <bsd.port.post.mk>
